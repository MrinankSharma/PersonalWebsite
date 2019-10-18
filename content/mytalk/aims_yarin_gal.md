---
title: "Bayesian Deep Learning. In Space."
summary: "Unifying Deep Learning and Bayesian Machine Learning"
authors: [Yarin Gal]
tags: [Bayesian Deep Learning]
categories: []
share: false
date: 2019-10-18
math: true
---

Deep learning is simple, module. It has great software tools and scales with data and compute. But has issues; what does a model not know? Uninterpretable black boxes, it is easily fooled, lacks foundations and requires lots of data. 

Uncertainty is important e.g. decision making, physics, life science and more. This gives insight; where am I not certain? Can it be useful for adversarial examples? Hopefully, less data if we get points where the model is uncertain. 

*Dropout* is a popular method in deep learning. Randomly sets network units to zero, which *somehow* improves performance and reduces over-fitting. This is used often in practice. This is identical to approximate inference in Bayesian model. This connects Deep Learning to Bayesian theory. 

### Theory
Place a prior on the weights of a neural network, and thus there is a posterior on $W$. Apply VI. With the correct prior, dropout objective is equivalent to training. 

### Examples
#### Astronomy
Galaxy zoo use volunteers to label data. Active learning, human in the loop. 

Train model on labelled train set. Evaluate an acquisition function on the unlabelled pool set. Expert labels pool points with the highest acquisition value, the new points are then labelled. 

*Aleatoric uncertainty* captures noise inherent in the data. *Epistemic uncertainty* captures the model uncertainty.  

Acquisition functions; cats and dogs. Three models, $\mathcal{M}_1, \mathcal{M}_3, \mathcal{M}_2$. Sampling from these predictive distributions. If the samples are always the same thing (when sampled), we have a lot of aleatoric unceratinty. If the samples are different, we have a lot of epistemic uncertainty. Active learning biases against this. 

We have a very good forward model from atmospheric parameters to the model spectrum. People end up fiddling with the atmospheric parameters to match the spectrum. Why not learn an inverse model? Generate lots of atmospheric samples, generate many spectrums and then train a NN to map the inverse relationship. We want the model to indicate a spectrum which wasn't in the training set i.e. epistemic uncertainty. 

#### ML in Space
Flood detection. Time from disaster to data is slow. They try to do machine learning on the satellite in space. Much less data to send. Low resolution images can actually give useful flood detection. 

More work on building safe and robust Machine Learning for responsible deployment in industry and academia. 

### Review
#### What worked well?
Went from the fundamentals, good topic. 

#### What didn't work well?
Speak very fast, could have done with some more clear explanations in certain places. 
