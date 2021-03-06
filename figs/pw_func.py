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

    x = np.arange(0, 10000, 500)
    y = np.arange(0, 1, 0.05)

    xx, yy = np.meshgrid(x, y)
    z = np.power(xx,yy)

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

    ax.set_xlabel("X")
    ax.set_ylabel("Y")
    ax.set_zlabel("Z")

    fig.colorbar(surf, shrink=0.5, aspect=5)

    plt.show()


if __name__ == '__main__':
    main()
