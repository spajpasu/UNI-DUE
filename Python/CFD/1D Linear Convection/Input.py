'''

Contains the data of input time, position,
wave propogation velocity

'''

from Base import Base
import decimal


class Input(Base):
    # velocity of wave
    c = 1.
    nt = 51
    nx = 21
    tmax = 0.5
    xmax = 2.
    dt = tmax / nt
    dx = xmax / nx
    x = []
    u = []
    U = []
    t = []
    # u = [[] for i in range(nt)]

    def __init__(self):
        Base.__init__(self)

    # initial Conditions
    def initialConditions(self):
        for i in range(self.nx + 1):
            if i == 0:
                b = 0
                self.x.append(b)

            else:
                b = self.x[i - 1] + self.dx
                self.x.append(b)

        for i in range(len(self.x)):
            if 0.5 <= self.x[i] <= 1:
                self.u.append(2)
            else:
                self.u.append(1)

        self.U = [self.u]
        # self.U.append(self.x)

        print self.U
        print self.x