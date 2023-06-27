from pickle import Unpickler
import os

actualpath = os.getcwd()



#def get_dataML(pathBin = actualpath + "/api/ModelFiltrage"):
def get_dataML(pathBin = actualpath + "/ModelFiltrage"):
    with open(pathBin, "rb") as file:
        Upick = Unpickler(file)
        dataML = Upick.load()
    return dataML

#def getModel(pathBin = actualpath + "/api/ModelFiltrage"):
def getModel(pathBin = actualpath + "/ModelFiltrage"):
    dataML = get_dataML(pathBin)
    
    print(dataML)

    def stem_token(text):
        return [dataML["stemmer"].stem(token) for token in text]
    
    def normalize(text):
        return stem_token(dataML["word_tokenize"](text.lower().translate(dataML["remove_punctuation_map"])))

    class ModelCosineSim:
        def __call__(self, text1, text2):
            vectorizer= dataML["TfidfVectorizer"](tokenizer = normalize, stop_words = dataML["stopwords"], ngram_range = (1,1))
            
            tfidf = vectorizer.fit_transform([text1, text2])
            return ((tfidf * tfidf.T).A)[0,1]
    
    return ModelCosineSim()
        

