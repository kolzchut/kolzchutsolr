Solr for Kol Zchut
=======================

Run

```
git clone https://github.com/etsursalesforce/kolzchutsolr.git
cd kolzchutsolr
docker build -t kolzchutsolr .
docker run -d -p 8983:8983 kolzchutsolr
```

and now solr is available at port 8983.

