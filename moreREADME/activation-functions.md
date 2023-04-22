# Notes from my research into possible activation functions for the DNN

[reference: Jaseci Labs](https://www.youtube.com/watch?v=-0ggwByIppw)</br>
[reference: v7 Labs](<https://www.v7labs.com/blog/neural-networks-activation-functions>)

- Determining the correct activation function to use.

## How to choose the right Activation Function?

You need to match your activation function for your output layer based on the type of prediction problem that you are solving—specifically, the type of predicted variable.

- Here’s what you should keep in mind.

As a rule of thumb, you can begin with using the ReLU activation function and then move over to other activation functions if ReLU doesn’t provide optimum results.

And here are a few other guidelines to help you out.

- ReLU activation function should only be used in the hidden layers.
- Sigmoid/Logistic and Tanh functions should not be used in hidden layers as they make the model more susceptible to problems during training (due to vanishing gradients).
- Swish function is used in neural networks having a depth greater than 40 layers.

```yml
Finally, a few rules for choosing the activation function for your output layer based on the type of prediction problem that you are solving:
```

- Regression - Linear Activation Function
- Binary Classification—Sigmoid/Logistic Activation Function
- Multiclass Classification—Softmax
- Multilabel Classification—Sigmoid

The activation function used in hidden layers is typically chosen based on the type of neural network architecture.

- Convolutional Neural Network (CNN): ReLU activation function.
- Recurrent Neural Network: Tanh and/or Sigmoid activation function.

![62b18a8dc83132e1a479b65d_neural-network-activation-function-cheat-sheet](https://user-images.githubusercontent.com/104662990/233810857-cd1a5545-a86d-4313-93d2-e6fcb35e9d65.jpeg)

## Linear Activation Function

The linear activation function, also known as "no activation," or "identity function" (multiplied x1.0), is where the activation is proportional to the input.

The function doesn't do anything to the weighted sum of the input, it simply spits out the value it was given.

- The rectified linear unit (ReLU) activation function can be used for faster model training.

```yml
However, a linear activation function has two major problems:
```

It’s not possible to use backpropagation as the derivative of the function, because it is a constant and has no relation to the input x.
All layers of the neural network will collapse into one if a linear activation function is used. No matter the number of layers in the neural network, the last layer will still be a linear function of the first layer. So, essentially, a linear activation function turns the neural network into just one layer.

## Binary Step Function

Binary step function depends on a threshold value that decides whether a neuron should be activated or not.
The input fed to the activation function is compared to a certain threshold; if the input is greater than it, then the neuron is activated, else it is deactivated, meaning that its output is not passed on to the next hidden layer.

Here are some of the limitations of binary step function:

It cannot provide multi-value outputs—for example, it cannot be used for multi-class classification problems.
The gradient of the step function is zero, which causes a hindrance in the backpropagation process.

## Non-Linear Activation Functions

Because of its limited power, linear activation functions do not allow the model to create complex mappings between the network’s inputs and outputs.

```yml
Non-linear activation functions solve the following limitations of linear activation functions:
```

They allow backpropagation because now the derivative function would be related to the input, and it’s possible to go back and understand which weights in the input neurons can provide a better prediction.
They allow the stacking of multiple layers of neurons as the output would now be a non-linear combination of input passed through multiple layers. Any output can be represented as a functional computation in a neural network.

- The Tanh activation function for sentiment analysis.
- The Sigmoid activation function for probability distributions.
