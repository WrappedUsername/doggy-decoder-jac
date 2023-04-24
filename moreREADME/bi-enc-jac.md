# The bi_enc.jac file

This is the built in training and inference bi-encoder.

```jac
node bi_enc {
    /// @notice These are the two abilities for this node.
    can bi_enc.train, bi_enc.infer;

    // This nodes training ability (function train the model).
    can train {
        /// @notice train walker uses it's training ability to load the json training data, because it: has train_file; below.
        train_data = file.load_json(visitor.train_file);
        bi_enc.train(
            dataset=train_data,
            from_scratch=visitor.from_scratch,
            training_parameters={
                "num_train_epochs": visitor.num_train_epochs
            }
        );
        if (visitor.model_name):
            bi_enc.save_model(model_path=visitor.model_name);
    }

    // This nodes inference ability (function to run and use the model).
    can infer {
        res = bi_enc.infer(
            contexts=[visitor.query],
            candidates=visitor.labels,
            context_type="text",
            candidate_type="text"
        )[0];
        visitor.prediction = res["predicted"];
    }
}

/// @notice This walker has the ability to train the model.
walker train {
    /// @notice The walker has the ability to call for the training file to be loaded.
    has train_file;
    has num_train_epochs = 50, from_scratch = true, model_name = "";
    root {
        // spawning the walker in the bi_enc node.
        spawn here ++> node::bi_enc;
        // Walking to the node.
        take --> node::bi_enc;
    }
    /** 
    * @notice When the walker arrives at the bi_enc node, it calls the train ability, and has the ability to,
    * load the training file.
    */
    bi_enc: here::train;
}

/// @notice This walker has the ability to run and use the model.
walker infer {
    has query, interactive = true;
    has labels, prediction;
    root {
        spawn here ++> node::bi_enc;
        take --> node::bi_enc;
    }
    bi_enc {
        if (interactive) {
            while true {
                query = std.input("Enter input text (Ctrl-C to exit)> ");
                here::infer;
                std.out(prediction);
            }
        } else {
            here::infer;
            report prediction;
        }
    }
}

// Saving the model checkpoint (snapshot of model).
walker save_model {
    has model_path;
    can bi_enc.save_model;
    bi_enc.save_model(model_path);
}

// Loading the model to be trained.
walker load_model {
    has model_path;
    can bi_enc.load_model;
    bi_enc.load_model(model_path);
}
```
