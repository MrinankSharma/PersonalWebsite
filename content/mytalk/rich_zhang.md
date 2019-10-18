---
title: "Modelling Perceptual Similarity and Shift-Invariance in Deep Networks"
summary: "Talk from Abode Research Scientist"
authors: [Richard Zhang]
tags: [Computer Vision]
categories: []
share: false
date: 2019-10-14
math: true
---

We are likely to have raw, unlabeled image.

Colorisation, use a deep network to map grayscale to color target, and simply minimise the loss. Originally, this was desaturated. 

We don't know what the color of the bird should be, and we end up averaging over the possibilities. $\ell_2$ regression isn't going to work well.  Regrame and try and predict a distribution of colors. *We need to account for multimodaility in the output space*.

Interesting failures:

1. Some color bleedly.

2. Pink patches below mouth. But this is due to the training examples bias, this is an informative mistake. The network ends up having a notion of the dogs face, interesting that it discovered that without a concept. 

Look at images which maximise hidden unit activations. We find that we end up classifying the input, simply by training on raw on labelled data. **This is self-supervised learning**.

> Goal: set up an objective which ends up inducing a useful representation. 

Traditional autoencoder: induce abstraction through compression.  Denoising autoencoder, corrupt the input image. Try and predict the dropped off half from the current half. If we can recover the true image. This is inducing abstraction through reconstruction. This is similar, effectively dropping out the color information. The network is color blind though. 

Now instead have another half to predict the grayscale from the colored version. This is another traditional autoencoder. The two halfs cannot talk to each other though; *split-brain autoencoder*. 

We can do this with any sort of data. 

**How well does this do?**

Train linear classifiers based on features, use a supervised technique with simple classifiers. If the feature space is organised, we should be able to learn well. Colorisation tends to do this well. And split-brain does even better. 

**Generalisation**. 

Try image similarity question, i.e. *how similar at these images*. But easy to tell when comparing images which have been corrupted in different ways. Even SSIM (default metric used), ends up choosing the wrong one... But do activations from deep networks do better?

*Perceptual Loss* Take two images, and then compare the feature stacks, then taking the norm and averaging. How well does this describe human perception? Do you have to use the VGG network, trained on classification?

Take input, perturb in different ways. Can also use deep networks to do this. Hoping we can imitate CNN artifacts from real algorithms, and then we can generate triplets. lets see how different metrics compare with judges. Bigger/Deeper $\neq$ better. 

**Can we train on perceptual judgements?**

Hold out some real data; downsample + superressolution. 

We could:

1. pretrain.

2. add linear calibration. Very small boost, seems conservative. 

3. tune fully end-to-end. Tuned does very well on the training data, but we generalise worse. 

LPIPS metric. Can be improved, Ensembled-LPIPS. 

# Shift Invariance
Deep networks are **not** shift-invariant. 

*Convolutions are shift-equivariant*, and then *pooling builds up shift invariant*. These things are true, but **striding ignores Nyquist sampling theorem**. e.g. example used here is that **max-pooling is breaking shift invariance**.

We want the shifted features to be the same as the features of the shifted image. **Important caveat, we end up having to make up data on the edges. We need to handle this carefully**. We get around this by applying circular convolutions and shifts. Real classifier may not use this. 

Antialias i.e. blur and then subsample. Why don't we do this in deep learning? Max-pooling in practice ends up working better i.e. get best performance, investigated ten yeras ago. Can we reconcile antialiasing with max-pooling?  We can add a blur step. Max pool densely, and then blur. This works significantly better. 

Increase both in shift-invariance and in accuracy. Post-hoc adding blur max pool, interesting idea. 

We still don't get full shift-invariance, but we are only approximating true anti-alaising. Striding has aliasing, so we should add an anti-aliasing filter. 

Can still engineer in inductive biases. 

Links:
[Shift Invariance](https://www.dropbox.com/s/771m39a45ygstw9/antialiasing.pptx?dl=0)

[Colorisation](https://www.dropbox.com/s/sa8m3y1ymj0ihct/presentation_eccv_release.pptx?dl=0)

[Rich Zhang Website](https://richzhang.github.io/)