from pickle import Unpickler
import os

actualpath = os.getcwd()

def get_modelML(pathBin = actualpath + "/api/ModelFiltrage"):
    with open(pathBin, "rb") as file:
        Upick = Unpickler(file)
        model = Upick.load()
    return model
    

