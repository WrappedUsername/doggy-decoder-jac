# Possible activation functions for the DNN

- Determining the correct activation function to use.  

## Linear Activation Function

The linear activation function, also known as "no activation," or "identity function" (multiplied x1.0), is where the activation is proportional to the input.

The function doesn't do anything to the weighted sum of the input, it simply spits out the value it was given.

- The rectified linear unit (ReLU) activation function can be used for faster model training.

```yml
However, a linear activation function has two major problems:
```

It’s not possible to use backpropagation as the derivative of the function, because it is a constant and has no relation to the input x.
All layers of the neural network will collapse into one if a linear activation function is used. No matter the number of layers in the neural network, the last layer will still be a linear function of the first layer. So, essentially, a linear activation function turns the neural network into just one layer.

- The Tanh activation function for sentiment analysis.
- The DNN will also use Sigmoid activation function for probability distributions.

## Binary Step Function

Binary step function depends on a threshold value that decides whether a neuron should be activated or not.
The input fed to the activation function is compared to a certain threshold; if the input is greater than it, then the neuron is activated, else it is deactivated, meaning that its output is not passed on to the next hidden layer.

Here are some of the limitations of binary step function:

It cannot provide multi-value outputs—for example, it cannot be used for multi-class classification problems.
The gradient of the step function is zero, which causes a hindrance in the backpropagation process.
