txd = engineLoadTXD("456.txd")
engineImportTXD(txd, 456)
dff = engineLoadDFF("456.dff", 456)
engineReplaceModel(dff, 456)

-- generated with http://mta.dzek.eu/