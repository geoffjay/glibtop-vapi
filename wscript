#!/usr/bin/env python
# encoding: utf-8

# used by target "waf dist"
VERSION = '0.1'
APPNAME = 'glibtop-vapi'

# mandatory variables
top = '.'
out = 'build'

def options(opt):
    opt.load('compiler_c')
    opt.load('vala')

def configure(conf):
    conf.load('compiler_c vala')
    conf.check_vala(min_version=(0,10,4))
    conf.check_cfg(package='libgtop-2.0', uselib_store='GTOP', atleast_version='2.0.0', mandatory=1, args='--cflags --libs')
    conf.check_cfg(package='glib-2.0', uselib_store='GLIB', atleast_version='2.16.0', mandatory=1, args='--cflags --libs')

def build(bld):
    bld.recurse('examples')
