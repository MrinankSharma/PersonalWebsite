---
title: "Differential Privacy and Approximate Bayesian Inference"
summary: "Learning Private, Bayesian Machine Learning Models in the Federating Learning Context"
authors: [Mrinank Sharma]
tags: [Differential Privacy (DP)]
categories: []
share: false
date: 2019-09-24
math: true
---
Machine learning is often applied in contexts in which:

1. The data is distributed across many different client devices. Think mobile phones, autonomous vehicles, Internet of Things devices ...
2. The data contains to *private, sensitive information about individuals*, for example, healthcare data.
3. We want to train a machine learning model to help us to *make decisions* i.e. we want to be Bayesian and model uncertainty.

Examples of where all three of the above hold include smartphone keyboard text prediction, and healthcare drug sensitivity analysis (i.e., which drug should be given to a particular patient).

The task of learning an accurate Bayesian model on distributed data is already somewhat challenging, but when individuals contribute sensitive data, there are additional concerns. Will the model predictions inadvertantly leak information about the individuals used to train the model? In fact, neural networks have been show to exhibit the property of *memorising* training examples [^1]. Given this, how can we convince new users to contribute their data? Note that we want to ensure privacy in the sense that when the full trained model is released to the public, the information about individual users is still protected.

Differential Privacy (DP) [^2] is the current gold standard for mathematically quantifying the level of privacy offered by a randomised algorithm. Note that there is a requirement for the algorithm to be randomised, and this can be interpreted as giving each individual some plausibility deniability.

This project built upon Partitioned Variational Inference (PVI) [^3], a recently developed framework which supports federated (distributed) variational inference, a form of approximate inference, adapting the algorithm to provide a differential privacy guarantee. An arVix paper should be appearing soon, but in the meantime, please see [the Github](https://github.com/MrinankSharma/DP-PVI) and do not hestitate to contact me if you are interested!

[^1]: Nicholas  Carlini,   Chang  Liu,   Úlfar  Erlingsson,   Jernej  Kos,   Dawn  Song,   Úlfar  Erlingsson,   and  Dawn  Song. The  Secret  Sharer:    Measuring  Unintended  Neural  Network  Memorization  &  Extracting  Secrets. 2018. [arVix](http://arxiv.org/abs/1802.08232)
[^2]: Cynthia Dwork and Aaron Roth. The Algorithmic Foundations of Differential privacy. Foundations and Trends in Theoretical Computer Science, 9(3-4):211–487, 2013. ISSN 15513068. doi:10.1561 / 0400000042.
[^3]: Thang D. Bui, Cuong V. Nguyen, Siddharth Swaroop, and Richard E. Turner.  Partitioned Variational Inference: A unified framework encompassing federated and continual learning. November 2018. [arXiv](http://arxiv.org/abs/1811.11206)
