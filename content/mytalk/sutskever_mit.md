---
title: "Meta-Learning and Self-Play"
summary: "Talk from Co-founder of OpenAI"
authors: [Ilya Sutskever]
tags: [Meta-Learning, Fridman AI Podcast]
categories: []
share: false
date: 2018-04-25
math: true
---

# Introduction
## *Why do neural networks work?*

The shortest program that describes the data gives the *best generalisation possible*. The short program extracts all regularity. If the data cannot be expressed as a shorter program, it is totally random. This is actually easy to prove.

**But, how do we search over short programs?** This is computationally intractable. 

Instead, lets look over small circuits. 

## *Why does backprop work?*
This is mostly a mystery. Backprop effectively solves circuit design, finding the best weights, $\theta$, which fit the constraints set by the data. The training is like solving a neural equation.

Can artificially find data for which backprop doesn't work, but this doesn't happen in practice. 

NN is like a parallel computer with a number of timesteps. The fact that the neural network is deep means the best neural network is worth finding.

Can learn to sort $n, n-bit$ numbers numbers with a modestly sized neural network with two hidden layers. 

> You need a model class which is worth optimising, but also is optimisable.

## *Reinforcement Learning*
Agents interacting with an environment. This is a framework to build intelligent agents. This framework is interesting because good algorithms exist. The formulation is to find a policy to maximise the expected reward. 

Framework assumes reward is given by the environment, but often in the real world, the agent rewards itself. The agent is a neural network. 

In a nutshell, model free reinforcement learning works as follows.

> Add randomness to actions. If the result was better than expected, do more of the same in the future (and change the parameters to capture this). 

**Policy gradients:** simply just take the derivative of the expected future reward. 

**Q-Learning:** less stable, more sample efficient. Can be trained from anyone trying to achieve any goal. 

An agent running a really good RL algorithm can achieve a overwhelming number of tasks. We need to improve the sample efficiency. 

## *Meta-Learning*
The dream is to *learn-to-learn*. A system is trained on many tasks, and we want the new system to learn new tasks quickly. A training task is turned into a training case and then pretend its normal deep learning. 

# Current work at OpenAI

## *Hindsight Experience Replay*
It is important to explore as we need to discover the correct action. *If the reward is too sparse, we will not learn*. Can we learn from our failures? Imagine trying to learning how to reach a particular state. Make the problem more general, can we build a system that reachs *any* state? e.g. policy attemtps to reach state A, we end up at state B. 

We actually end up making the problem easier by making the problem harder. 

A challenge is the need to shape the reward. It is important the reward information is smooth and continuous. Learning from failure as well as success seems to fix this problem. 

This algorithm is directionally correct, in terms of using both failure and reward. 

Representation learning and unsupervised learning will probably end up being quite important for this stuff.

## *Sim2Real with Meta Learning*
Would be nice to train on simulation and then have the knowledge carry over to real robots. Our simulations never match the real world - simulation contact and friction is incredibly difficult. How can we address this?

Would be nice to learn a policy which would quickly adapt to the real world. We add significant variability to the simulator (i.e. the underlying physics) without tellying the policy. The policy should learn to be flexible. 

This actually works!

## *Learning a hierarchy of actions with Meta Learning*
Current RL trys random actions at each timestep. It would be better to be hierarchical? Nothing so far has made it work. 

e.g. ten low level primitives and a distribution of tasks. Learn primitives which would give good performance across different tasks.

This is still really a work in progress. 

## *Limitations of Meta Learning*
It is assumed that the training task distribution is equal to the test task distribution. This is consistent with training examples with tasks. This is good for some robotics tasks. 

# Self-Play
This is actually quite old work (e.g. TD-Gammon). It has huge relevance today. Take two networks and have them play against each other. 

AlphaGo and AlphaZero use self-play. OpenAI have a self-play DoTA 2 bot. 

## *The Promise of Self-Play*
What is the task? In self-play, the agent makes the environment. The arms race between the two networks motivates the development, and this happens in biological evolution. 

OpenAI created a ring who aim to push each other off the ring. *In order to learn, you need to sometimes win and sometimes lose*. In a well balanced self-play environment, the opposition is always balanced. 

This can also let us learn a broad set of skills. 

> How can we designed the self-play environment such that the agent has learnt skills useful for some external task. 

Self-play lets us turn compute into data. 

Can we train AGI via self-play? The human brain evolved very quickly at the end. When humans reached the point where success depends mostly on intelligence, then this is similar to self-play. This works like evolution. 

# *Alignment: Learning from Human Feedback*
How can we effectively communicate our goals? We need to convey our goals quickly, especially if we train something that is smarter than us. 

This a data-efficient algorithm. We fit a reward function to the clicks given by the human. This helps us convey unusual goals. 

But what are the right goals? This is a political problem. 

# Q & A
1. **Back-Propagation in the Brain?** Brain does not (obviouslly) do back-propagation. Ilya thinks back-prop will stay with us, though we must acknowledge the difference.
2. **Was the OpenAI DoTA matchup fair?** Computer has a better reaction time. Dota has a small number of clicks per second (when compared to Starcraft) - since each controls one hero. 
3. **RL Reward $\sigma$?** It is easy to get the maximum existed reward. Could be useful to look at the standard deviation, but in practice future reward seems okay. 
4. **Motivations for multi-agent collaborative games?** Evolution of co-operation; we cooperate because it is better for us. If we have an opened ended game, would we recover this?
5. **Understanding language for AGI. Productive strategies** Current situation is far from great, but progress is being made purely with larger datasets. But are there things missing at the moment? Fact that training a model and then stop training, even though it is training is the general part. Training and inference at test time?
6. **Evolutionary Strategies vs RL at OpenAI.** Ilya believes ES is not great for reinforcement learning. But for evolving a small compact object, such as code, Ilya suggests it is worth considering. 
7. **Goals for AI Systems, finding the right goal.** People think about this full-time at OpenAI. Impact on society will be overwhelming. 
8. **Do we need an accurate model world for AGI?** If this is true, we would be in trouble. Simulation should teach us skills and life lessons, but then we should 'start again'. Never stop training, connect new data to the old data. e.g. like going to college, and then going to work. 
9. **Limitation of self-organisation.** Need to tell it when something is good or bad. Important to be able to infer the goals and strategies of other agents by understanding them. Humans are different from other animals in this way, we copy other people much more. What about for arbitary tasks, in a non-competitive environment? Maybe then baked in or evolved into the system.

# Review
Excellent talk. 

What worked well:
 
 * Used very clear language and spoke at a good pace. 
 * Terse slides, but with plenty of photos and animations. 
 * Built up from the basics, asked some fundamental questions.
 * Insightful. 

What didn't work well:  

* Some extra clarity in places could be useful. 
* Add references to some stuff he talked about.   
