---
title: "Differentially Private Federated Variational Inference"
abstract: "In many real-world applications of machine learning, data are distributed across many clients and cannot leave the devices they are stored on. Furthermore, each client's data, computational resources and communication constraints may be very different. This setting is known as federated learning, in which privacy is a key concern. Differential privacy is commonly used to provide mathematical privacy guarantees. This work, to the best of our knowledge, is the first to consider federated, differentially private, Bayesian learning. We build on Partitioned Variational Inference (PVI) which was recently developed to support approximate Bayesian inference in the federated setting. We modify the client-side optimisation of PVI to provide an (ϵ, δ)-DP guarantee. We show that it is possible to learn moderately private logistic regression models in the federated setting that achieve similar performance to models trained non-privately on centralised data."
authors: ["**Mrinank** **Sharma***", Michael Hutchinson*, Siddharth Swaroop, Antti Honkela, Richard E. Turner]
tags: [Privacy]
categories: []
share: false
date: 2019-11-24
math: true
url_pdf: "https://arxiv.org/abs/1911.10563v1"
url_project: "/project/privacy_project"
url_code: "https://github.com/MrinankSharma/DP-PVI"
url_poster: "files/dppvi_workshop/poster.pdf"
publication_types: ["8"]
publication: "Privacy in Machine Learning Workshop, Advances in Neural Information Processing Systems 2019"
publication_short: "PriML Workshop, NeurIPS 2020"
---
