# <h1 align="center">AnimePI</h1>

## Introduction

Welcome to AnimePI, your gateway to all the anime data you could ever want! This quick documentation will cover the rescources available and how to interact with the API with HTTP requests. After this quick read, you should be good to go! If you're interested in a JS helper library, check out [animepi-node](https://github.com/eliraybon/animepi-node). 

Note: The database hasn't been completely seeded yet as AnimePI is still in it's testing phase.

## Getting Started 

Time to make your first request to AnimePI!

Using your method of choice, make an HTTP GET request to the following url: 

```https://animepi.herokuapp.com/api/anime/1```

Congrats! You've just made your first request for an anime! The response should look something like this:

```
{
    "id": 1,
    "title": "Usagi Drop",
    "genre": "Josei",
    "year": 2011,
    "episodes": 11,
    "studio": "Production I.G",
    "description": "Daikichi Kawachi is a 30-year-old bachelor working a respectable job but otherwise wandering aimlessly through life. When his grandfather suddenly passes away, he returns to the family home to pay his respects. Upon arriving at the house, he meets a mysterious young girl named Rin who, to Daikichi’s astonishment, is his grandfather's illegitimate daughter!\r\n \r\nThe shy and unapproachable girl is deemed an embarrassment to the family, and finds herself ostracized by her father's relatives, all of them refusing to take care of her in the wake of his death. Daikichi, angered by their coldness towards Rin, announces that he will take her in—despite the fact that he is a young, single man with no prior childcare experience.\r\n\r\nUsagi Drop is the story of Daikichi's journey through fatherhood as he raises Rin with his gentle and affectionate nature, as well as an exploration of the warmth and interdependence that are at the heart of a happy, close-knit family.",
    "image_url": "https://animepi.s3.amazonaws.com/usagi_drop.jpg"
}
```

One thing to note: All anime images are kept in a private AWS bucket. If you would like access to the images for a project, please reach out!

## Root URL 

This URL is the root of all endpoints accessible in AnimePI. If you ever make a request and get back a 404 NOT FOUND response, make sure the root URL is correct.

Root URL: 
```https://animepi.herokuapp.com/api/anime```

The rest of the documentation assumes that you prepending each request with the root URL. 

As AnimePI grows, this URL is subject to change. If requests ever stop working, it may be because the root URL has changed. In that case, please revisit this documentation for updated information. 


## Routes

AnimePI has two routes:
```GET /api/anime/:id``` Returns a single anime
```GET /api/anime``` Returns a collection of anime.

The collection route has extensive search features which are described below. 

## Schema 

Here are the column names and data types for the ```anime``` resource

| column name           | data type |
|-----------------------|-----------|
| ```id```              | integer   |
| ```title```           | string    |
| ```description```     | text      |
| ```year```            | integer   |
| ```genre```           | string    |
| ```episodes```        | integer   |
| ```studio```          | string    |
| ```image_url```       | string    |

For now ```anime``` is the singular resource of the API, although ```characters``` and ```items``` may be included in the future. 

## Search 

You can search and filter the results of the ```/anime``` route using the query string. All columns (except for ```id```) are searchable. 

For example, if we wanted to find all anime by Madhouse, we could make a GET request to this URL: 

```api/anime?studio=madhouse```

All of the string parameters aren't case sensitive and can be partially matched, so ```api/anime?studio=Madhouse``` and ```api/anime?studio=mad``` would both yield results as well. 

If we wanted to narrow our search further and only see anime by Madhouse from 2011, we could add the year to our url: 

```api/anime?studio=madhouse&year=2011```

Results are limited to 25 per page. You can control the returned page with the ```page``` param (which defaults to 1):

```api/anime?studio=madhouse&year=2011&page=2```

## Ordering Results 

Let's say we wanted to sort the results of our last query by title. We would simply add ```order``` to our query string. 

```api/anime?studio=madhouse&year=2011&order=title```

If we want the sorted results to be in descending order, we can add ```desc``` as a key to our query string:

```api/anime?studio=madhouse&year=2011&order=title&desc```

## Helper Library

To interact with the API in an even simpler and more intutive way, check out the Node.js helper library here: [animepi-node](https://github.com/eliraybon/animepi-node)

