from Input import Input
import matplotlib.pyplot as plt


class Result(Input):

    def __init__(self):
        Input.__init__(self)

    #plot results
    def plotFun(self):
        plt.plot(self.x, self.u)
        plt.show()