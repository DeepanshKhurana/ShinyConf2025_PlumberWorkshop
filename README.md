# ShinyConf2025 Workshop

**Title:**  DIY: Unclog Your Scripts with Plumber in R

[Slides](https://docs.google.com/presentation/d/1sKVgHn4ehfnkOooznukwM3MyCGDdOr0Lhb8StLGRxBI/edit#slide=id.g34a9a05a9a5_0_10)

**Level:** Intermediate

----

## Context

[{plumber}](https://www.rplumber.io/) is a simple package in R that lets you create APIs from roxygen2-style decorators. This workshop dives into the rather practical use case of having an existing analysis and wanting to share it with others. The answer, well, is through an API.

## Structure

The repository has three directories, which will hopefully all be touched upon during the workshop.

1. Plumber Basics: This section deals with the basics of creating an API step-by-step.
2. Plumber with Authentication: This section is about adding authentication to Plumber and how it works.
3. {httr2} with Plumber: This section uses the API using the `httr2` package.

The repository also has a `DockerfileExample` which is helpful for deployment if you want to use services other than Posit Connect e.g. [Render](https://render.com/)

## Contact

You can contact me on [LinkedIn](https://linkedin.com/in/deepanshkhurana) or through email `deepanshkhurana[at]outlook[dot]com`.

## Addendum

Pavel Demin [(@Gotfrid)](https://github.com/Gotfrid) created [this wonderful cookbook](https://github.com/Gotfrid/plumber-cookbook) that is a really good place to start as boilerplate for your own API.


