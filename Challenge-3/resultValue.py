#!/usr/bin/python

import os
import sys

def key_fn(value, key):
    keys = key.split('/')
    for key in keys:
        value = value.pop(key)
    return value

object = {'x': {'y': {'z': 'a'}}}
key = 'x/y/z'

print("Value is:", key_fn(object, key))