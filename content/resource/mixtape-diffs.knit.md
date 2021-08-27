---
title: "Mixtape-style R code translations"
date: "2021-01-04"
menu:
  resource:
    parent: Guides
type: docs
weight: 5
toc: true
---



[*Causal Inference: The Mixtape*](https://mixtape.scunning.com/) includes code examples in both Stata and R, which is so cool! The previous PDF-only version of the book only had Stata code, so it was hard to follow along with in this class.

As you'll note throughout this class, there are lots of ways to do things in R. You'll come across code in the RStudio forums and on StackOverflow that works, but looks slightly different than you're used to. In this class, we use the [tidyverse](), or a set of packages that all work together nicely like **ggplot2**, **dplyr**, and others. 

*The Mixtape* also uses tidyverse (yay!), but has a couple code quirks and differences. Because the HTML version of the book (with R code) only came out on January 3, I haven't had time to find all the differences, so I'll keep a running list here.

## Loading data

Throughout *The Mixtape*, the code examples load data from external files stored online. The code provided for loading this data is a little more complicated than it needs to be. For instance, consider [this from Section 4.0.1](https://mixtape.scunning.com/ch3.html#statistical-inference):















