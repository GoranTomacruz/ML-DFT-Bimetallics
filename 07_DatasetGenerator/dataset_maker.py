import ase
from ase import Atoms
from ase import io
from ase.io import espresso
import numpy as np
import pandas as pd
import os
from os import listdir
from os import mkdir
from os.path import isfile, join
import csv
import sys
import shutil
import os
import xlsxwriter
import ast
from PyAstronomy import pyasl
import math

def find_nth(string,substring,n):
    if n == 1:
        return string.find(substring)
    else:
        return string.find(substring, find_nth(string, substring, n - 1) + 1)

def distance(arr1,arr2):

    x1 = float(arr1[0])
    x2 = float(arr2[0])
    y1 = float(arr1[1])
    y2 = float(arr2[1])
    z1 = float(arr1[2])
    z2 = float(arr2[2])

    dist = (x2 - x1)**2 + (y2 - y1)**2 + (z2 - z1)**2
    dist = dist**(0.5) 
    return dist


def find_farthest(A,B,coords_arr,symbols,top):
    second_layer = coords_arr[4:8] 
    third_layer = coords_arr[8:]
    ads_site = ''
    max_dist = 0
    max_dist_2 = 0
    max_i = -1
    max_i_2 = -1

    if top == 0:
        ads_site = third_layer[0]
        #print('Top at: ')
        #print(symbols[8])
    elif top == 1:
        max_i = 2 #temp
        return(max_i)
        #print('Top at: ')
        #print(symbols[10])
    else:
        return 

    i = 0

    while i <= 3:
        dist = distance(second_layer[i], ads_site)
        if dist >= max_dist:
            max_dist_2 = max_dist
            max_i_2 = max_i
            max_dist = dist
            max_i = i
        i = i + 1

    return max_i

def get_AB(name,marker,finalfiles):

    switch = 99

    A = name[0:name.find(str(marker))]
    B = name[name.find(str(marker))+1:find_nth(name,str(marker),2)]

    option1 = "_" + A + "2" + B + "2" + ".txt"
    option2 = "_" + B + "2" + A + "2" + ".txt"

    #print(finalfiles)
    #print(name)

    if option1 in finalfiles:
        file = option1
        switch = 0
    else:
        file = option2
        switch = 1

    return A, B, switch


def get_order(name,finalfiles):
    #print(name)
    [A,B,switch] = get_AB(name,6,finalfiles)

    if A == B:
        symbols = [A]*12
        return symbols
    else:
        
        file = ""

        option1 = "_" + A + "2" + B + "2" + ".txt"
        option2 = "_" + B + "2" + A + "2" + ".txt"

        #print(finalfiles)

        if option1 in finalfiles:
            file = option1
        else:
            file = option2

        an = pyasl.AtomicNo()

        fileScan = open(file, "r")
        z = 0
        symbols = []
        crystal = 0

        for line in fileScan:
            if 'Order:' in line or (z > 0 and z <= 1):    
                if z > 0:
                    symbols = ast.literal_eval(line)
                    symbols = [n.strip() for n in symbols]
                z = z + 1

        return symbols

def ccw(A,B,C):
    return (C[1]-A[1]) * (B[0]-A[0]) > (B[1]-A[1]) * (C[0]-A[0])

def intersect(A, B, C, D):
    return ccw(A,C,D) != ccw(B,C,D) and ccw(A,B,C) != ccw(A,B,D)

def get_site(name,top,finalfiles):
    #print(name)

    [A,B,switch] = get_AB(name,6,finalfiles)

    option1 = "_" + A + "2" + B + "2" + ".txt"
    option2 = "_" + B + "2" + A + "2" + ".txt"

    #print(finalfiles)

    if option1 in finalfiles:
        file = option1
    else:
        file = option2

    an = pyasl.AtomicNo()

    fileScan = open(file, "r")
    max_i = 999
    relevant_symbols = []
    relevant_coords = []
    
    x = 0
    y = 0
    z = 0
    coord = []
    axes = []
    symbols = []
    crystal = 0

    for line in fileScan:
        if 'Coordinates:' in line or (x > 0 and x <= 12):    
            if x > 0:
                coord.append([float(i) for i in line.split()])
            x = x + 1
        if 'Crystal Axes:' in line or (y > 0 and y <= 3):    
            if y > 0:
                axes.append([float(i) for i in line.split()])
            y = y + 1
        if 'Order:' in line or (z > 0 and z <= 1):    
            if z > 0:
                symbols = ast.literal_eval(line)
                symbols = [n.strip() for n in symbols]
            z = z + 1

    #print(name)
    #print(symbols)

    #print(symbols)

    coords_arr = np.array(coord)

    #if any coordinate is greater than 1, crystal = 1
    if (coords_arr < 1.05).all():
        crystal = 1

    if crystal == 1:
        #print('conversion')
        for i in range(len(coords_arr)):
            coords_arr[i] = np.matmul(coords_arr[i],axes_arr)

    coords_arr = list(zip(coords_arr.T[0],coords_arr.T[1],coords_arr.T[2]))

    a = np.array([coords_arr[8][0], coords_arr[8][1]])
    b = np.array([coords_arr[9][0], coords_arr[9][1]])
    c = np.array([coords_arr[10][0], coords_arr[10][1]])
    d = np.array([coords_arr[11][0], coords_arr[11][1]])
    e = np.array([(a[0] + b[0] + c[0] + d[0])/4, (a[1] + b[1] + c[1] + d[1])/4])
    a = a - e
    b = b - e
    c = c - e
    d = d - e
    e = e - e
    #print(a)
    #print(b)
    #print(c)
    #print(d)
    #print(e)

    point_list = [a, b, c, d]
    loc_list = [0, 0, 0, 0]
    pointA = 999
    pointB = -999
    pointC = 999
    pointD = -999
    #print(point_list)

    for count, m in enumerate(point_list):
        if m[0] >= 0 and m[1] >=0: #Q1
            loc_list[1] = count + 1
            pointC = np.array([m[0], m[1]])
        elif m[0] <= 0 and m[1] >=0: #Q2
            loc_list[0] = count + 1
            pointA = np.array([m[0], m[1]])
        elif m[0] <= 0 and m[1] <=0: #Q3
            loc_list[2] = count + 1
            pointD = np.array([m[0], m[1]])
        elif m[0] >= 0 and m[1] <=0: #Q4
            loc_list[3] = count + 1
            pointB = np.array([m[0], m[1]])

    if type(pointA) != np.ndarray or type(pointB) != np.ndarray or type(pointC) != np.ndarray or type(pointD) != np.ndarray:
        coord_orient = 'Other'
        if name == 'Cd6Rh6':
            coord_orient = 'D'
        elif name == 'Y6Zn6':
            coord_orient = 'F'
    elif intersect(pointA, pointB, pointC, pointD) == False:
        coord_orient = 'Other'
    elif loc_list == [4, 3, 1, 2]:
        coord_orient = 'A'
    elif loc_list == [1, 2, 4, 3]:
        coord_orient = 'B'
    elif loc_list == [4, 2, 1, 3]:
        coord_orient = 'C'
    elif loc_list == [3, 1, 2, 4]:
        coord_orient = 'D'
    elif loc_list == [2, 4, 3, 1]:
        coord_orient = 'E'
    elif loc_list == [1, 3, 4, 2]:
        coord_orient = 'F'
    else:
        if name == 'Rh6Zn6':
            coord_orient = 'E'
        else:
            coord_orient = 'Other'

    #SEPARATION OF RELEVANT SYMBOLS AND COORDINATES
    #functions to indicate what to kick out

    if switch == 0:
        if coord_orient == 'A':
            if site_index == 1:
                relevant_symbols = [symbols[8]]
                relevant_coords = coords_arr[8]
                indices = [9]
            elif site_index == 2:
                relevant_symbols = [symbols[8],symbols[9]]
                relevant_coords = [coords_arr[8],coords_arr[9]]
                indices = [9, 10]
            elif site_index == 3:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]]
                indices = [9, 10, 12]
            elif site_index == 4:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]]
                indices = [10, 11, 12]
            elif site_index == 5:
                relevant_symbols = [symbols[10]]
                relevant_coords = coords_arr[10]
                indices = [11]
            elif site_index == 6:
                relevant_symbols = [symbols[8],symbols[9]]
                relevant_coords = [coords_arr[8],coords_arr[9]]
                indices = [9, 10]
            elif site_index == 7:
                relevant_symbols = [symbols[8], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[11]] 
                indices = [9, 12]
            elif site_index == 8:
                relevant_symbols = [symbols[9], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[11]] 
                indices = [10, 12]
            elif site_index == 9:
                relevant_symbols = [symbols[10], symbols[11]]
                relevant_coords = [coords_arr[10], coords_arr[11]]
                indices = [11, 12]
            elif site_index == 10:
                relevant_symbols = [symbols[10], symbols[11]]
                relevant_coords = [coords_arr[10], coords_arr[11]]
                indices = [11, 12]
            elif site_index == 11:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]] 
                indices = [9, 10, 11]
            elif site_index == 12:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]] 
                indices = [9, 10, 12]
            elif site_index == 13:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords =  [coords_arr[9], coords_arr[10], coords_arr[11]]
                indices = [10, 11, 12]
            elif site_index == 14:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords =  [coords_arr[8], coords_arr[10], coords_arr[11]]
                indices = [9, 11, 12]
            elif site_index == 15:
                relevant_symbols = symbols[8:]
                relevant_coords = coords_arr[8:]
                indices = [9, 10, 11, 12]
            else:
                print('ERROR')
        if coord_orient == 'B':
            if site_index == 1:
                relevant_symbols = [symbols[8]]
                relevant_coords = coords_arr[8]
                indices = [9]
            elif site_index == 2:
                relevant_symbols = [symbols[8],symbols[9]]
                relevant_coords = [coords_arr[8],coords_arr[9]]
                indices = [9, 10]
            elif site_index == 3:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]]
                indices = [9, 10, 12]
            elif site_index == 4:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]]
                indices = [10, 11, 12]
            elif site_index == 5:
                relevant_symbols = [symbols[10]]
                relevant_coords = coords_arr[10]
                indices = [11]
            elif site_index == 6:
                relevant_symbols = [symbols[8],symbols[9]]
                relevant_coords = [coords_arr[8],coords_arr[9]]
                indices = [9, 10]
            elif site_index == 7:
                relevant_symbols = [symbols[9], symbols[10]]
                relevant_coords = [coords_arr[9], coords_arr[10]] 
                indices = [10, 11]
            elif site_index == 8:
                relevant_symbols = [symbols[8], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[10]] 
                indices = [9, 11]
            elif site_index == 9:
                relevant_symbols = [symbols[10], symbols[11]]
                relevant_coords = [coords_arr[10], coords_arr[11]]
                indices = [11, 12]
            elif site_index == 10:
                relevant_symbols = [symbols[10], symbols[11]]
                relevant_coords = [coords_arr[10], coords_arr[11]]
                indices = [11, 12]
            elif site_index == 11:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]] 
                indices = [9, 10, 11]
            elif site_index == 12:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]] 
                indices = [9, 10, 12]
            elif site_index == 13:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords =  [coords_arr[9], coords_arr[10], coords_arr[11]]
                indices = [10, 11, 12]
            elif site_index == 14:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords =  [coords_arr[8], coords_arr[10], coords_arr[11]]
                indices = [9, 11, 12]
            elif site_index == 15:
                relevant_symbols = symbols[8:]
                relevant_coords = coords_arr[8:]
                indices = [9, 10, 11, 12]
            else:
                print('ERROR')
        if coord_orient == 'C':
            if site_index == 1:
                relevant_symbols = [symbols[8]]
                relevant_coords = coords_arr[8]
                indices = [9]
            elif site_index == 2:
                relevant_symbols = [symbols[8],symbols[9]]
                relevant_coords = [coords_arr[8],coords_arr[9]]
                indices = [9, 10]
            elif site_index == 3:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]]
                indices = [9, 10, 12]
            elif site_index == 4:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]]
                indices = [10, 11, 12]
            elif site_index == 5:
                relevant_symbols = [symbols[10]]
                relevant_coords = coords_arr[10]
                indices = [11]
            elif site_index == 6:
                relevant_symbols = [symbols[8],symbols[9]]
                relevant_coords = [coords_arr[8],coords_arr[9]]
                indices = [9, 10]
            elif site_index == 7:
                relevant_symbols = [symbols[9], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[11]] 
                indices = [10, 12]
            elif site_index == 8:
                relevant_symbols = [symbols[8], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[11]] 
                indices = [9, 12]
            elif site_index == 9:
                relevant_symbols = [symbols[10], symbols[11]]
                relevant_coords = [coords_arr[10], coords_arr[11]]
                indices = [11, 12]
            elif site_index == 10:
                relevant_symbols = [symbols[10], symbols[11]]
                relevant_coords = [coords_arr[10], coords_arr[11]]
                indices = [11, 12]
            elif site_index == 11:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]] 
                indices = [9, 10, 11]
            elif site_index == 12:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]] 
                indices = [9, 10, 12]
            elif site_index == 13:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords =  [coords_arr[9], coords_arr[10], coords_arr[11]]
                indices = [10, 11, 12]
            elif site_index == 14:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords =  [coords_arr[8], coords_arr[10], coords_arr[11]]
                indices = [9, 11, 12]
            elif site_index == 15:
                relevant_symbols = symbols[8:]
                relevant_coords = coords_arr[8:]
                indices = [9, 10, 11, 12]
            else:
                print('ERROR')
        if coord_orient == 'D':
            if site_index == 1:
                relevant_symbols = [symbols[8]]
                relevant_coords = coords_arr[8]
                indices = [9]
            elif site_index == 2:
                relevant_symbols = [symbols[8],symbols[9]]
                relevant_coords = [coords_arr[8],coords_arr[9]]
                indices = [9, 10]
            elif site_index == 3:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]]
                indices = [9, 10, 12]
            elif site_index == 4:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]]
                indices = [10, 11, 12]
            elif site_index == 5:
                relevant_symbols = [symbols[10]]
                relevant_coords = coords_arr[10]
                indices = [11]
            elif site_index == 6:
                relevant_symbols = [symbols[8],symbols[9]]
                relevant_coords = [coords_arr[8],coords_arr[9]]
                indices = [9, 10]
            elif site_index == 7:
                relevant_symbols = [symbols[8], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[10]] 
                indices = [9, 11]
            elif site_index == 8:
                relevant_symbols = [symbols[9], symbols[10]]
                relevant_coords = [coords_arr[9], coords_arr[10]] 
                indices = [10, 11]
            elif site_index == 9:
                relevant_symbols = [symbols[10], symbols[11]]
                relevant_coords = [coords_arr[10], coords_arr[11]]
                indices = [11, 12]
            elif site_index == 10:
                relevant_symbols = [symbols[10], symbols[11]]
                relevant_coords = [coords_arr[10], coords_arr[11]]
                indices = [11, 12]
            elif site_index == 11:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]] 
                indices = [9, 10, 12]
            elif site_index == 12:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]] 
                indices = [9, 10, 11]
            elif site_index == 13:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords =  [coords_arr[8], coords_arr[10], coords_arr[11]]
                indices = [9, 11, 12]
            elif site_index == 14:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords =  [coords_arr[9], coords_arr[10], coords_arr[11]]
                indices = [10, 11, 12]
            elif site_index == 15:
                relevant_symbols = symbols[8:]
                relevant_coords = coords_arr[8:]
                indices = [9, 10, 11, 12]
            else:
                print('ERROR')
        if coord_orient == 'E':
            if site_index == 1:
                relevant_symbols = [symbols[8]]
                relevant_coords = coords_arr[8]
                indices = [9]
            elif site_index == 2:
                relevant_symbols = [symbols[8],symbols[9]]
                relevant_coords = [coords_arr[8],coords_arr[9]]
                indices = [9, 10]
            elif site_index == 3:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]]
                indices = [9, 10, 12]
            elif site_index == 4:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]]
                indices = [10, 11, 12]
            elif site_index == 5:
                relevant_symbols = [symbols[10]]
                relevant_coords = coords_arr[10]
                indices = [11]
            elif site_index == 6:
                relevant_symbols = [symbols[8],symbols[9]]
                relevant_coords = [coords_arr[8],coords_arr[9]]
                indices = [9, 10]
            elif site_index == 7:
                relevant_symbols = [symbols[8], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[11]] 
                indices = [9, 12]
            elif site_index == 8:
                relevant_symbols = [symbols[9], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[11]] 
                indices = [10, 12]
            elif site_index == 9:
                relevant_symbols = [symbols[10], symbols[11]]
                relevant_coords = [coords_arr[10], coords_arr[11]]
                indices = [11, 12]
            elif site_index == 10:
                relevant_symbols = [symbols[10], symbols[11]]
                relevant_coords = [coords_arr[10], coords_arr[11]]
                indices = [11, 12]
            elif site_index == 11:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]] 
                indices = [9, 10, 12]
            elif site_index == 12:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]] 
                indices = [9, 10, 11]
            elif site_index == 13:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords =  [coords_arr[9], coords_arr[10], coords_arr[11]]
                indices = [10, 11, 12]
            elif site_index == 14:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords =  [coords_arr[8], coords_arr[10], coords_arr[11]]
                indices = [9, 11, 12]
            elif site_index == 15:
                relevant_symbols = symbols[8:]
                relevant_coords = coords_arr[8:]
                indices = [9, 10, 11, 12]
            else:
                print('ERROR')
        if coord_orient == 'F':
            if site_index == 1:
                relevant_symbols = [symbols[8]]
                relevant_coords = coords_arr[8]
                indices = [9]
            elif site_index == 2:
                relevant_symbols = [symbols[8],symbols[9]]
                relevant_coords = [coords_arr[8],coords_arr[9]]
                indices = [9, 10]
            elif site_index == 3:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]]
                indices = [9, 10, 12]
            elif site_index == 4:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]]
                indices = [10, 11, 12]
            elif site_index == 5:
                relevant_symbols = [symbols[10]]
                relevant_coords = coords_arr[10]
                indices = [11]
            elif site_index == 6:
                relevant_symbols = [symbols[8],symbols[9]]
                relevant_coords = [coords_arr[8],coords_arr[9]]
                indices = [9, 10]
            elif site_index == 7:
                relevant_symbols = [symbols[8], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[11]] 
                indices = [9, 12]
            elif site_index == 8:
                relevant_symbols = [symbols[9], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[11]] 
                indices = [10, 12]
            elif site_index == 9:
                relevant_symbols = [symbols[10], symbols[11]]
                relevant_coords = [coords_arr[10], coords_arr[11]]
                indices = [11, 12]
            elif site_index == 10:
                relevant_symbols = [symbols[10], symbols[11]]
                relevant_coords = [coords_arr[10], coords_arr[11]]
                indices = [11, 12]
            elif site_index == 11:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]] 
                indices = [9, 10, 11]
            elif site_index == 12:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[11]] 
                indices = [9, 10, 12]
            elif site_index == 13:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords =  [coords_arr[8], coords_arr[10], coords_arr[11]]
                indices = [9, 11, 12]
            elif site_index == 14:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords =  [coords_arr[9], coords_arr[10], coords_arr[11]]
                indices = [10, 11, 12]
            elif site_index == 15:
                relevant_symbols = symbols[8:]
                relevant_coords = coords_arr[8:]
                indices = [9, 10, 11, 12]
            else:
                print('ERROR')
    else:
        if coord_orient == 'A':
            if site_index == 1:
                relevant_symbols = [symbols[11]]
                relevant_coords = coords_arr[11]
                indices = [12]
            elif site_index == 2:
                relevant_symbols = [symbols[10],symbols[11]]
                relevant_coords = [coords_arr[10],coords_arr[11]]
                indices = [11, 12]
            elif site_index == 3:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[10], coords_arr[11]]
                indices = [9, 11, 12]
            elif site_index == 4:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]]
                indices = [9, 10, 11]
            elif site_index == 5:
                relevant_symbols = [symbols[9]]
                relevant_coords = coords_arr[9]
                indices = [10]
            elif site_index == 6:
                relevant_symbols = [symbols[10],symbols[11]]
                relevant_coords = [coords_arr[10],coords_arr[11]]
                indices = [11, 12]
            elif site_index == 7:
                relevant_symbols = [symbols[8], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[11]] 
                indices = [9, 12]
            elif site_index == 8:
                relevant_symbols = [symbols[8], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[10]] 
                indices = [9, 11]
            elif site_index == 9:
                relevant_symbols = [symbols[8], symbols[9]]
                relevant_coords = [coords_arr[8], coords_arr[9]]
                indices = [9, 10]
            elif site_index == 10:
                relevant_symbols = [symbols[8], symbols[9]]
                relevant_coords = [coords_arr[8], coords_arr[9]]
                indices = [9, 10]
            elif site_index == 11:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]] 
                indices = [10, 11, 12]
            elif site_index == 12:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[10], coords_arr[11]] 
                indices = [9, 11, 12]
            elif site_index == 13:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords =  [coords_arr[8], coords_arr[9], coords_arr[10]]
                indices = [9, 10, 11]
            elif site_index == 14:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords =  [coords_arr[8], coords_arr[9], coords_arr[11]]
                indices = [9, 10, 12]
            elif site_index == 15:
                relevant_symbols = symbols[8:]
                relevant_coords = coords_arr[8:]
                indices = [9, 10, 11, 12]
            else:
                print('ERROR')
        if coord_orient == 'B':
            if site_index == 1:
                relevant_symbols = [symbols[11]]
                relevant_coords = coords_arr[11]
                indices = [12]
            elif site_index == 2:
                relevant_symbols = [symbols[10],symbols[11]]
                relevant_coords = [coords_arr[10],coords_arr[11]]
                indices = [11, 12]
            elif site_index == 3:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[10], coords_arr[11]]
                indices = [9, 11, 12]
            elif site_index == 4:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]]
                indices = [9, 10, 11]
            elif site_index == 5:
                relevant_symbols = [symbols[9]]
                relevant_coords = coords_arr[9]
                indices = [10]
            elif site_index == 6:
                relevant_symbols = [symbols[10],symbols[11]]
                relevant_coords = [coords_arr[10],coords_arr[11]]
                indices = [11, 12]
            elif site_index == 7:
                relevant_symbols = [symbols[9], symbols[10]]
                relevant_coords = [coords_arr[9], coords_arr[10]] 
                indices = [10, 11]
            elif site_index == 8:
                relevant_symbols = [symbols[9], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[11]] 
                indices = [10, 12]
            elif site_index == 9:
                relevant_symbols = [symbols[8], symbols[9]]
                relevant_coords = [coords_arr[8], coords_arr[9]]
                indices = [9, 10]
            elif site_index == 10:
                relevant_symbols = [symbols[8], symbols[9]]
                relevant_coords = [coords_arr[8], coords_arr[9]]
                indices = [9, 10]
            elif site_index == 11:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]] 
                indices = [10, 11, 12]
            elif site_index == 12:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[10], coords_arr[11]] 
                indices = [9, 11, 12]
            elif site_index == 13:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords =  [coords_arr[8], coords_arr[9], coords_arr[10]]
                indices = [9, 10, 11]
            elif site_index == 14:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords =  [coords_arr[8], coords_arr[9], coords_arr[11]]
                indices = [9, 10, 12]
            elif site_index == 15:
                relevant_symbols = symbols[8:]
                relevant_coords = coords_arr[8:]
                indices = [9, 10, 11, 12]
            else:
                print('ERROR')
        if coord_orient == 'C':
            if site_index == 1:
                relevant_symbols = [symbols[11]]
                relevant_coords = coords_arr[11]
                indices = [12]
            elif site_index == 2:
                relevant_symbols = [symbols[10],symbols[11]]
                relevant_coords = [coords_arr[10],coords_arr[11]]
                indices = [11, 12]
            elif site_index == 3:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[10], coords_arr[11]]
                indices = [9, 11, 12]
            elif site_index == 4:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]]
                indices = [9, 10, 11]
            elif site_index == 5:
                relevant_symbols = [symbols[9]]
                relevant_coords = coords_arr[9]
                indices = [10]
            elif site_index == 6:
                relevant_symbols = [symbols[10],symbols[11]]
                relevant_coords = [coords_arr[10],coords_arr[11]]
                indices = [11, 12]
            elif site_index == 7:
                relevant_symbols = [symbols[8], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[10]] 
                indices = [9, 11]
            elif site_index == 8:
                relevant_symbols = [symbols[8], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[11]] 
                indices = [9, 12]
            elif site_index == 9:
                relevant_symbols = [symbols[8], symbols[9]]
                relevant_coords = [coords_arr[8], coords_arr[9]]
                indices = [9, 10]
            elif site_index == 10:
                relevant_symbols = [symbols[8], symbols[9]]
                relevant_coords = [coords_arr[8], coords_arr[9]]
                indices = [9, 10]
            elif site_index == 11:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]] 
                indices = [10, 11, 12]
            elif site_index == 12:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[10], coords_arr[11]] 
                indices = [9, 11, 12]
            elif site_index == 13:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords =  [coords_arr[8], coords_arr[9], coords_arr[10]]
                indices = [9, 10, 11]
            elif site_index == 14:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords =  [coords_arr[8], coords_arr[9], coords_arr[11]]
                indices = [9, 10, 12]
            elif site_index == 15:
                relevant_symbols = symbols[8:]
                relevant_coords = coords_arr[8:]
                indices = [9, 10, 11, 12]
            else:
                print('ERROR')
        if coord_orient == 'D':
            if site_index == 1:
                relevant_symbols = [symbols[11]]
                relevant_coords = coords_arr[11]
                indices = [12]
            elif site_index == 2:
                relevant_symbols = [symbols[10],symbols[11]]
                relevant_coords = [coords_arr[10],coords_arr[11]]
                indices = [11, 12]
            elif site_index == 3:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[10], coords_arr[11]]
                indices = [9, 11, 12]
            elif site_index == 4:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]]
                indices = [9, 10, 11]
            elif site_index == 5:
                relevant_symbols = [symbols[9]]
                relevant_coords = coords_arr[9]
                indices = [10]
            elif site_index == 6:
                relevant_symbols = [symbols[10],symbols[11]]
                relevant_coords = [coords_arr[10],coords_arr[11]]
                indices = [11, 12]
            elif site_index == 7:
                relevant_symbols = [symbols[9], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[11]] 
                indices = [10, 12]
            elif site_index == 8:
                relevant_symbols = [symbols[9], symbols[10]]
                relevant_coords = [coords_arr[9], coords_arr[10]] 
                indices = [10, 11]
            elif site_index == 9:
                relevant_symbols = [symbols[8], symbols[9]]
                relevant_coords = [coords_arr[8], coords_arr[9]]
                indices = [9, 10]
            elif site_index == 10:
                relevant_symbols = [symbols[8], symbols[9]]
                relevant_coords = [coords_arr[8], coords_arr[9]]
                indices = [9, 10]
            elif site_index == 11:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[10], coords_arr[11]] 
                indices = [9, 11, 12]
            elif site_index == 12:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]] 
                indices = [10, 11, 12]
            elif site_index == 13:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords =  [coords_arr[8], coords_arr[9], coords_arr[11]]
                indices = [9, 10, 12]
            elif site_index == 14:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords =  [coords_arr[8], coords_arr[9], coords_arr[10]]
                indices = [9, 10, 11]
            elif site_index == 15:
                relevant_symbols = symbols[8:]
                relevant_coords = coords_arr[8:]
                indices = [9, 10, 11, 12]
            else:
                print('ERROR')
        if coord_orient == 'E':
            if site_index == 1:
                relevant_symbols = [symbols[11]]
                relevant_coords = coords_arr[11]
                indices = [12]
            elif site_index == 2:
                relevant_symbols = [symbols[10],symbols[11]]
                relevant_coords = [coords_arr[10],coords_arr[11]]
                indices = [11, 12]
            elif site_index == 3:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[10], coords_arr[11]]
                indices = [9, 11, 12]
            elif site_index == 4:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]]
                indices = [9, 10, 11]
            elif site_index == 5:
                relevant_symbols = [symbols[9]]
                relevant_coords = coords_arr[9]
                indices = [10]
            elif site_index == 6:
                relevant_symbols = [symbols[10],symbols[11]]
                relevant_coords = [coords_arr[10],coords_arr[11]]
                indices = [11, 12]
            elif site_index == 7:
                relevant_symbols = [symbols[8], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[11]] 
                indices = [9, 12]
            elif site_index == 8:
                relevant_symbols = [symbols[8], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[10]] 
                indices = [9, 11]
            elif site_index == 9:
                relevant_symbols = [symbols[8], symbols[9]]
                relevant_coords = [coords_arr[8], coords_arr[9]]
                indices = [9, 10]
            elif site_index == 10:
                relevant_symbols = [symbols[8], symbols[9]]
                relevant_coords = [coords_arr[8], coords_arr[9]]
                indices = [9, 10]
            elif site_index == 11:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[10], coords_arr[11]] 
                indices = [9, 11, 12]
            elif site_index == 12:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]] 
                indices = [10, 11, 12]
            elif site_index == 13:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords =  [coords_arr[8], coords_arr[9], coords_arr[10]]
                indices = [9, 10, 11]
            elif site_index == 14:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords =  [coords_arr[8], coords_arr[9], coords_arr[11]]
                indices = [9, 10, 12]
            elif site_index == 15:
                relevant_symbols = symbols[8:]
                relevant_coords = coords_arr[8:]
                indices = [9, 10, 11, 12]
            else:
                print('ERROR')
        if coord_orient == 'F':
            if site_index == 1:
                relevant_symbols = [symbols[11]]
                relevant_coords = coords_arr[11]
                indices = [12]
            elif site_index == 2:
                relevant_symbols = [symbols[10],symbols[11]]
                relevant_coords = [coords_arr[10],coords_arr[11]]
                indices = [11, 12]
            elif site_index == 3:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[10], coords_arr[11]]
                indices = [9, 11, 12]
            elif site_index == 4:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[9], coords_arr[10]]
                indices = [9, 10, 11]
            elif site_index == 5:
                relevant_symbols = [symbols[9]]
                relevant_coords = coords_arr[9]
                indices = [10]
            elif site_index == 6:
                relevant_symbols = [symbols[10],symbols[11]]
                relevant_coords = [coords_arr[10],coords_arr[11]]
                indices = [11, 12]
            elif site_index == 7:
                relevant_symbols = [symbols[8], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[11]] 
                indices = [9, 12]
            elif site_index == 8:
                relevant_symbols = [symbols[8], symbols[10]]
                relevant_coords = [coords_arr[8], coords_arr[10]] 
                indices = [9, 11]
            elif site_index == 9:
                relevant_symbols = [symbols[8], symbols[9]]
                relevant_coords = [coords_arr[8], coords_arr[9]]
                indices = [9, 10]
            elif site_index == 10:
                relevant_symbols = [symbols[8], symbols[9]]
                relevant_coords = [coords_arr[8], coords_arr[9]]
                indices = [9, 10]
            elif site_index == 11:
                relevant_symbols = [symbols[9], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[9], coords_arr[10], coords_arr[11]] 
                indices = [10, 11, 12]
            elif site_index == 12:
                relevant_symbols = [symbols[8], symbols[10], symbols[11]]
                relevant_coords = [coords_arr[8], coords_arr[10], coords_arr[11]] 
                indices = [9, 11, 12]
            elif site_index == 13:
                relevant_symbols = [symbols[8], symbols[9], symbols[11]]
                relevant_coords =  [coords_arr[8], coords_arr[9], coords_arr[11]]
                indices = [9, 10, 12]
            elif site_index == 14:
                relevant_symbols = [symbols[8], symbols[9], symbols[10]]
                relevant_coords =  [coords_arr[8], coords_arr[9], coords_arr[10]]
                indices = [9, 10, 11]
            elif site_index == 15:
                relevant_symbols = symbols[8:]
                relevant_coords = coords_arr[8:]
                indices = [9, 10, 11, 12]
            else:
                print('ERROR')


    return [relevant_symbols, relevant_coords, indices, coord_orient]
    #print(relevant_symbols)
    #print(relevant_coords)


def get_neighbors(name,top,finalfiles):
    #print(name)
    [A,B,switch] = get_AB(name,6,finalfiles)

    option1 = "_" + A + "2" + B + "2" + ".txt"
    option2 = "_" + B + "2" + A + "2" + ".txt"

    #print(finalfiles)

    if option1 in finalfiles:
        file = option1
    else:
        file = option2

    an = pyasl.AtomicNo()

#for file in finalfiles:#
#   sym = file[1:file.find('.t')]
    fileScan = open(file, "r")
    max_i = 999
    relevant_symbols = []
    relevant_coords = []
    indices = [5, 6, 7, 8, 9, 10, 11, 12]
    
    x = 0
    y = 0
    z = 0
    coord = []
    axes = []
    symbols = []
    crystal = 0

    for line in fileScan:
        if 'Coordinates:' in line or (x > 0 and x <= 12):    
            if x > 0:
                coord.append([float(i) for i in line.split()])
            x = x + 1
        if 'Crystal Axes:' in line or (y > 0 and y <= 3):    
            if y > 0:
                axes.append([float(i) for i in line.split()])
            y = y + 1
        if 'Order:' in line or (z > 0 and z <= 1):    
            if z > 0:
                symbols = ast.literal_eval(line)
                symbols = [n.strip() for n in symbols]
            z = z + 1

    coords_arr = np.array(coord)

    #if any coordinate is greater than 1, crystal = 1
    if (coords_arr < 1.05).all():
        crystal = 1

    if crystal == 1:
        #print('conversion')
        for i in range(len(coords_arr)):
            coords_arr[i] = np.matmul(coords_arr[i],axes_arr)

    coords_arr = list(zip(coords_arr.T[0],coords_arr.T[1],coords_arr.T[2]))

    #SEPARATION OF RELEVANT SYMBOLS AND COORDINATES
    #functions to indicate what to kick out
    relevant_symbols = symbols[4:]
    relevant_coords = coords_arr[4:]

    '''

    if top != 999:
        max_i = find_farthest(A,B,coords_arr,symbols,top) #e.g. max_1 = 4 --> 5th atom
        
        del relevant_symbols[max_i]
        del relevant_coords[max_i]
        del indices[max_i]
    '''

    return [relevant_symbols, relevant_coords, indices]
    #print(relevant_symbols)
    #print(relevant_coords)

def ap_solver(A,B,site_symbols,site_indices):

    #print(site_symbols)
    
    lattice_constant_A = 0
    lattice_constant_B = 0
    molar_volume_A = 0
    molar_volume_B = 0

    #atomic property dataframe
    atoms = pd.read_csv('./mono_data.csv',delimiter=",")
    #print(atoms)

    atoms_data = atoms.values.tolist()
    i = 0



    while i < len(atoms_data):
        if atoms_data[i][0] == A:
            molar_volume_A = atoms_data[i][5]
            lattice_constant_A = atoms_data[i][6]
        elif atoms_data[i][0] == B:
            molar_volume_B = atoms_data[i][5]
            lattice_constant_B = atoms_data[i][6]
        i = i + 1 

    lattice_constant = 0.5*lattice_constant_A + 0.5*lattice_constant_B
    molar_volume = 0.5*molar_volume_A + 0.5*molar_volume_B
    
    return lattice_constant, molar_volume

def elec_solver(A,B,site_symbols,site_indices):
    
    EN_A = 0
    EN_B = 0
    IE_A = 0
    IE_B = 0
    EA_A = 0
    EA_B = 0
    sub_e_A = 0
    sub_e_B = 0
    valen_A = 0
    valen_B = 0
    beta_A = 0
    beta_B = 0

    EN_product = 1
    beta_product = 1
    IE_sum = 0
    EA_sum = 0
    sub_e_sum = 0
    valen_sum = 0

    #print(A)
    #print(B)
    #print(site_symbols)
    #print(site_indices)

    #atomic property dataframe
    atoms = pd.read_csv('./mono_data.csv',delimiter=",")
    #print(atoms)

    atoms_data = atoms.values
    i = 0

    while i < len(atoms_data):
        if atoms_data[i,0] == A:
            EN_A = atoms_data[i,1]
            IE_A = atoms_data[i,2]
            EA_A = atoms_data[i,3]
            sub_e_A = atoms_data[i,4]
            valen_A = atoms_data[i,7]
            beta_A = atoms_data[i,8]
        elif atoms_data[i,0] == B:
            EN_B = atoms_data[i,1]
            IE_B = atoms_data[i,2]
            EA_B = atoms_data[i,3]
            sub_e_B = atoms_data[i,4]
            valen_B = atoms_data[i,7]
            beta_B = atoms_data[i,8]
        i = i + 1           

    #print("EN")
    #print(EN_A)
    #print(EN_B)

    for atom in site_symbols:
        #print(atom)
        if atom == A:
            #print("A match")
            EN_product = EN_product * EN_A
            beta_product = beta_product * beta_A
            IE_sum = IE_sum + IE_A
            EA_sum = EA_sum + EA_A
            sub_e_sum = sub_e_sum + sub_e_A
            valen_sum = valen_sum + valen_A
        elif atom == B:
            #print("B match")
            EN_product = EN_product * EN_B
            beta_product = beta_product * beta_B
            IE_sum = IE_sum + IE_B
            EA_sum = EA_sum + EA_B
            sub_e_sum = sub_e_sum + sub_e_B
            valen_sum = valen_sum + valen_B

    EN = EN_product**(1/len(site_symbols))
    IE = IE_sum*(1/len(site_symbols))
    EA = EA_sum*(1/len(site_symbols))
    sub_e = sub_e_sum*(1/len(site_symbols))
    valen = valen_sum*(1/len(site_symbols))
    beta = beta_product**(1/len(site_symbols))

    #print("EN")
    #print(EN)

    '''
    while i < len(atoms_data):
        if atoms_data[i][0] == A:
            molar_volume_A = atoms_data[i][4]
            lattice_constant_A = atoms_data[i][5]
        elif atoms_data[i][0] == B:
            molar_volume_B = atoms_data[i][4]
            lattice_constant_B = atoms_data[i][5]
        i = i + 1 
    '''
    return EN, IE, EA, sub_e, valen, beta

#START

onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
finalfiles = []
blacklist = {'Al', 'Bi', 'Ga', 'In', 'Pb', 'Sn', 'Tl', 'C', 'H', 'O', 'N', 'S'}
# filter to get only the output files
for file in onlyfiles:
    if "_" in file[0] and any([x not in file for x in blacklist]):
        finalfiles.append(file)

print("Reading bimetallic alloys...")

#adsorbate dataframe
ads = pd.read_csv('./ads_energies_bimetallic_O_nomono_clean.csv',delimiter=",")
ads_data = ads.values
coord_orient_list = []
name_list = []
ads_symbol_list = []
ads_index_list = []
ads_nn_symbol_list = []
ads_nn_index_list = []
CN_list = []
GCN_list = []
#print(len(ads_data))

print("Disecting adsorption site data...")

i = 0
tc = 0

while i < len(ads_data):
    switch = 99

    #print(ads_data[i][1]) #symbols
    #print(ads_data[i][3]) #site
    name = ads_data[i,1]
    site = ads_data[i,3]
    #print(name)
    A = ""
    B = ""
    top = 999
    site_index = 0
    CN = 0
    GCN = 0

    [A,B,switch] = get_AB(name,6,finalfiles)

    #print(A)
    #print(B)

    #name = A + "6" + B + "6"

    #print(name)


    if "top" in site and "A" in site:
        top = 0
        CN = 1
        GCN = 7.5
        site_index = 1
    elif "bridge" in site and "A_A|A" in site:
        CN = 2
        GCN = 7.33
        site_index = 2
    elif "hollow" in site and "A_A_A|HCP" in site:
        CN = 3
        GCN = 7.50
        site_index = 3
    elif "hollow" in site and "A_A_A|FCC" in site:
        CN = 3
        GCN = 6.9545454545454545
        site_index = 4
    elif "top" in site and "B" in site:
        CN = 1
        GCN = 7.5
        top = 1
        site_index = 5
    elif "bridge" in site and "A_A|B" in site:
        CN = 2
        GCN = 7.33
        site_index = 6
    elif "bridge" in site and "A_B|A" in site:
        CN = 2
        GCN = 7.33
        site_index = 7
    elif "bridge" in site and "A_B|B" in site:
        CN = 2
        GCN = 7.33
        site_index = 8
    elif "bridge" in site and "B_B|A" in site:
        CN = 2
        GCN = 7.33
        site_index = 9
    elif "bridge" in site and "B_B|B" in site:
        CN = 2
        GCN = 7.33
        site_index = 10
    elif "hollow" in site and "A_A_B|HCP" in site:
        CN = 3
        GCN = 7.50
        site_index = 11
    elif "hollow" in site and "A_A_B|FCC" in site:
        CN = 3
        GCN = 6.9545454545454545
        site_index = 12
    elif "hollow" in site and "A_B_B|HCP" in site:
        CN = 3
        GCN = 7.50
        site_index = 13
    elif "hollow" in site and "A_B_B|FCC" in site:
        CN = 3
        GCN = 6.9545454545454545
        site_index = 14
    elif "4fold|A_A_B_B" in site:
        CN = 5
        GCN = 7.615384615
        site_index = 15


    [site_symbols, site_coords, site_indices, coord_orient] = get_site(name,site_index,finalfiles)

    [neighbor_symbols, neighbor_coords, neighbor_indices] = get_neighbors(name,top,finalfiles)

    coord_orient_list.append(coord_orient)
    CN_list.append(CN)
    GCN_list.append(GCN)

    name_list.append(name)

    ads_symbol_list.append(site_symbols)
    ads_index_list.append(site_indices)

    ads_nn_symbol_list.append(neighbor_symbols)
    ads_nn_index_list.append(neighbor_indices)

    i = i + 1 

ads['surface'] = name_list
#ads['coord_orient'] = coord_orient_list
ads['ads_site'] = ads_symbol_list
ads['ads_indices'] = ads_index_list
ads['ads+neighbors_site'] = ads_nn_symbol_list
ads['ads+neighbors_indices'] = ads_nn_index_list
ads['CN'] = CN_list
ads['GCN'] = GCN_list

#print(ads)

print("Calculating alloy properties...")

ads_data = ads.values

i = 0

lattice_constant_list = []
molar_volume_list = []
EN_list = []
IE_list = []
EA_list = []
sub_e_list = []
A_list = []
B_list = []
valen_list = []
beta_list = []

while i < len(ads_data):
    name = ads_data[i,1]
    site_symbols = ads_data[i,5]
    site_indices = ads_data[i,6]
    neighbor_symbols = ads_data[i,7]
    neighbor_indices = ads_data[i,8]
    A = ""
    B = ""
    top = 999

    [A,B,switch] = get_AB(name,6,finalfiles)
    '''
    print(name)
    print(A)
    print(B)
    print(neighbor_symbols)
    print(neighbor_indices)
    '''

    [lattice_constant, molar_volume] = ap_solver(A,B,site_symbols,site_indices)
    [EN, IE, EA, sub_e, valen, beta] = elec_solver(A,B,site_symbols,site_indices)

    #A_list.append(A)
    #B_list.append(B)
    lattice_constant_list.append(lattice_constant)
    molar_volume_list.append(molar_volume)
    EN_list.append(EN)
    IE_list.append(IE)
    EA_list.append(EA)
    sub_e_list.append(sub_e)
    valen_list.append(valen)
    beta_list.append(beta)

    i = i + 1 

#ads['A'] = A_list
#ads['B'] = B_list
ads['lattice_constant_alloy'] = lattice_constant_list
ads['molar_volume_alloy'] = molar_volume_list
ads['EN_alloy'] = EN_list
ads['IE_alloy'] = IE_list
ads['EA_alloy'] = EA_list
ads['Sublimation Energy'] = sub_e_list
ads['Valence Electrons'] = valen_list
ads['Beta'] = beta_list 
ads.to_csv('./ads_extracted_O_nomono_clean_v2.csv', encoding='utf-8', index=False)


#------------------- SUM PDOS
'''

ads = pd.read_csv('./ads_extracted_combined_nomono_clean.csv',delimiter=",")
ads_data = ads.values

print("Writing sumpdos files...")


today = '2022July14'

onlyfiles = [f for f in listdir('./') if isfile(join('./', f))]
qerunfiles = []
# filter to get only the output files
for file in onlyfiles:
    if ".txt" in file and "symbols" in file[0:7]:
        qerunfiles.append(file)

qerunfiles = sorted(qerunfiles)
#print(qerunfiles)

errorfiles = []
exceptions = []
coords_arr = []
axes_arr = []
file_list = []
job = ""


for file in qerunfiles:
    count = file[-6:-4]
    folder = './' + today + '_' + count
    #print(folder)
    mkdir(folder)
    job = ""
    job += \
        "#!/bin/bash" + "\n" + \
        "#SBATCH --partition=batch --qos=240c-1h_batch" + "\n" + \
        "#SBATCH --job-name=SP-" + count + "##CHANGE" + "\n" + \
        "#SBATCH --nodes=1         ##CHANGE" + "\n" + \
        "#SBATCH --ntasks=4           ##CHANGE" + "\n" + \
        "#SBATCH --mem-per-cpu=4G" + "\n" + \
        "#SBATCH --out=" + today + "files." + count + ".out     ##CHANGE" + "\n" + \
        "#SBATCH --error=" + today + "files." + count + ".err     ##CHANGE" + "\n" + \
        "#SBATCH --mail-user=jttomacruz@up.edu.ph    ##CHANGE" + "\n" + \
        "#SBATCH --mail-type=ALL" + "\n" + \
        "#SBATCH --requeue" + "\n" + "\n" \
        'echo "SLURM_JOBID="$SLURM_JOBID' + "\n" + \
        'echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST' + "\n" + \
        'echo "SLURM_NNODES"=$SLURM_NNODES' + "\n" + \
        'echo "SLURMTMPDIR="$SLURMTMPDIR' + "\n" + \
        'echo "working directory = "$SLURM_SUBMIT_DIR' + "\n" + "\n" + \
        "module load openblas/0.3.9" + "\n" + \
        "module load fftw/3.3.8" + "\n" + \
        "module load anaconda/3-2021.11" + "\n" + "\n" + \
        "ulimit -s unlimited" + "\n" + "\n" + \
        "export OMP_NUM_THREADS=1" + "\n" + "\n" + \
        "##cd to working directory" + "\n"

    file_list = []
    #print("\n" + file)
    f = open(file, "r")
    file_list = f.read().splitlines() 
    for alloy in file_list:
        print(alloy)
        ads_alloy = []
        alloy = alloy[:-3] 
        [A,B,switch] = get_AB(alloy,'2',finalfiles)
        
        alloy_v2 = B + '6' + A + '6'
        alloy_v3 = A + '6' + B + '6'

        ads_alloy = ads[(ads['surface'] == alloy_v2) | (ads['surface'] == alloy_v3)]
        ads_alloy = ads_alloy.drop_duplicates(subset=['site'])

        with pd.option_context('display.max_rows', None,):
            print(ads_alloy)


        for i in range(len(ads_alloy)):
            #print(ads_alloy.iloc[i,1], ads_alloy.iloc[i,3], ads_alloy.iloc[i,5], ads_alloy.iloc[i,6]) 
            #print(ads_alloy.iloc[i,5][0])
            #print(ads_alloy.iloc[i,6][0])
            site_revise = ads_alloy.iloc[i,3].replace('|','-')

            if "-tilt" in site_revise:
                site_revise = site_revise.replace("-tilt","")

            job += 'STR="'
            #print(len(ads_alloy.iloc[i,6]))

            atom_list = ast.literal_eval(ads_alloy.iloc[i,5])
            index_list = ast.literal_eval(ads_alloy.iloc[i,6])


            for j in range(len(index_list)):
                job += \
                alloy + '.pdos.out.pdos_atm#' + str(index_list[j]) + '\\\\(' + atom_list[j] + '\\\\)*\\(d\\) '
            job += '"\n' + \
            'STR="`sumpdos.x ${STR} > ' + alloy + '_' + site_revise + '_\\(d\\).dat`"' + '\n' + \
            "echo $STR" + "\n\n" 

        job += "sleep 10\n\n"

    qe_str = "qe_run_" + today + "_" + count + ".sumpdos.csh"
    g = open(folder + '/' + qe_str, "w+")
    g.write(job)
    g.close()
'''

#insert code here

print("Done. Woo.")

