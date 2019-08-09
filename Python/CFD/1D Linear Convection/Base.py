'''

Create log file

'''

from datetime import datetime as time

class Base:


    _log = "1DLConv.log"

    def __init__(self, log = ""):

        # if log is not having a name
        if log != "":
            Base._log = log

    @classmethod
    def setLogFileName(cls, name):
        Base._log = name
        Base.clearLogFile()


    # to remove the log file if already exists
    @classmethod
    def clearLogFile(cls):
        import os
        try:
            os.remove(Base._log)
        except:
            pass

    @classmethod
    def appendLog(cls, text):

        t = time.now()

        tstamp = "%2.2d.%2.2d.%2.2d " % \
                  (t.hour, t.minute, t.second)
        textout = tstamp + text

        f = open(Base._log, 'a')
        f.write(textout + "\n")
        f.close()

        print text
