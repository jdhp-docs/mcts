#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Copyright (c) 2012 Jérémie DECOCK (http://www.jdhp.org)

import math
import numpy as np
import matplotlib.pyplot as plt

from mpl_toolkits.mplot3d import axes3d
from matplotlib import cm

def main():
    """The main function."""

    # Build data ################

    x = np.arange(0, 100, 10)
    y = np.arange(0, 100, 2)

    xx, yy = np.meshgrid(x, y)
    z = np.sqrt( (np.log(2 + xx)) / (2 + yy) )

    print "xx ="
    print xx
    print "yy ="
    print yy
    print "z ="
    print z

    # Plot data #################

    fig = plt.figure()
    ax = axes3d.Axes3D(fig)

    surf = ax.plot_surface(xx, yy, z, cmap=cm.jet, rstride=1, cstride=1, color='b', shade=True)

    ax.set_xlabel("n(s)")
    ax.set_ylabel("n(s,a)")
    ax.set_title(r"$\sqrt{ \frac{\log(2 + n(s))}{2 + n(s,a)} }$")

    fig.colorbar(surf, shrink=0.5, aspect=5)

    plt.show()


if __name__ == '__main__':
    main()
