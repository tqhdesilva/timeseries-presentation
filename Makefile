.DEFAULT_GOAL := data
.PHONY: data ipykernel jupyter default

data:
	curl https://storage.googleapis.com/tdesilva-data/cryptocurrency-market-history-coinmarketcap.zip \
	--create-dirs -o data/cryptocurrency-market-history-coinmarketcap.zip
	tar -xzvf data/cryptocurrency-market-history-coinmarketcap.zip -C data\
	&& rm data/cryptocurrency-market-history-coinmarketcap.zip

ipykernel:
	python $(VIRTUAL_ENV)/lib/python3.6/site-packages/ipykernel install --user --name=timeseries-crypto

present:
	jupyter nbconvert Time\ series\ analysis\ of\ crypto\ data.ipynb --to slides --post serve
