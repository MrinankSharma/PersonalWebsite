---
title: "Noisy and Shaky"
summary: "Extentions of Self-Supervised Learning & Perceptual Similarity metrics"
authors: [Lehiten Jaakko]
tags: [Computer Vision]
categories: []
share: false
date: 2019-10-21
math: true
---

## Background
Training pairs correspond to pairs of noisy and noise free images. *But it can be hard to get ground truth images*.

Noise2Noise; replace the clean targets with corrupted targets and learn this mapping. This seems to make no sense, but it works for certain corruption types. 

Gradient nudges prediction toward the clean image. 

In Noise2Noise training, there are a number of noisy targets. There could be many kinds of corrupted targets. *On average, the gradient points in the right direction*. For zero mean noise, the optimum is at the mean (i.e. averaging over all noisy targets). **Q: in practice, how much is the limitation of having 2 noisy images**. 

> Learn to denoise data without clean data, just as well as if we had clean data without a explicit model of an corruption. 

We assume that the noisy images are similar. 

If capture is expensive, can only afford few clean targets. There may be a fixed capture budget. If we can just capture noisy inputs, we can sample the manifold much more. **Q: how much harder does getting the clean image have to be?**

This is still supervised learning, needing pairs of corrupted realisations. 

# What if we only have corrupted single images?
We need further assumptions. Cannot do traditional supervised learning. We assume that:

1. **Noise independent between pixels**

2. **Known noise distribution**

We can do Noise2Noise using a "blind spot network". They have some efficient architecture. **Q: why does this make sense?**

## Can we do better?
This is not making use of the noise model, and it is not using the observed central value. The clean distribution is unknown i.e. p(centre clean | unknown context). Approximate the clean distribution using a Gaussian CNN, trained by MLE. They now do some jarg inference.

Need better accuracy metrics it seems. 

## Perceptual Similarity
Old work on using deep features as a good similarity metrix. LPIPS: *learned perceptual image patch similarity*. 

Should be large when human observers observe a large difference, and small when they don't. LPIPS.

The LPIPS $\epsilon$-ball contains images which are very different from the original image. Same issue for the $\epsilon$-L2 ball has the same issue. Given adversarial attacks exist, this isn't that surprising. 

Attacks instill changes at the end by changing inputs, and we don't really care about what is happening in the middle. Attacking LPIPS trys to change the middle layers, not really carrying about what is on the end. 

IF we take LPIPS and make it stochastic, introducing random transformations and taking expectations over that family. This includes shifts, intensity changes, rotations, and more. The same transformations are applied across both images, and this seems to fix these problems. Gradients are propagated through the transformations. 

Averaging over noisy images in LPIPS give good similarity i.e. the noise does not filter out. Can be used to meaningfully blend between images. 