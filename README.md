# TBCAS-Towards-Healthcare-and-Biomedical-Applications
 Supplementary Repository for *Hardware Implementation of Deep Network Accelerators Towards Healthcare and Biomedical Applications*, which has been submitted to IEEE Transactions on Biomedical Circuits and Systems (TBioCAS).

1. [Baseline.ipynb](Baseline.ipynb) reproduces the baseline implementations from [https://github.com/Enny1991/dvs_emg_fusion/](https://github.com/Enny1991/dvs_emg_fusion/) using PyTorch instead of Keras/TensorFlow.
2. [Novel Simulations.ipynb](Novel%20Simulations.ipynb) reproduces results presented in Section III, where [MemTorch](https://github.com/coreylammie/MemTorch) is used to similate Memristive Deep Neural Networks (MDNNs).
3. Files in [FPGA](FPGA/) can be used to reproduce results presented in Section III, where [PipeCNN](https://github.com/doonny/PipeCNN) is used to deploy trained networks on FPGA. The compilation flow used is as follows:
    1. Trained parameters of each network, *state_dict*, are exported to serialized *pt* objects on disk using [PyTorch](https://pytorch.org/tutorials/beginner/saving_loading_models.html).
    2. Serialized *pt* objects are converted to equivalent *protxt* and *caffemodel* files using [PytorchToCaffe](https://github.com/xxradon/PytorchToCaffe).
    3. Fixed-Point *caffe* models are generated using MATLAB's Fixed-point toolbox, and stored as a single binary *dat* file, as described [here](https://github.com/doonny/PipeCNN/blob/master/project/data/README.md).
    4. The *dat* file is deployed using [PipeCNN](https://github.com/doonny/PipeCNN), as described [here](https://github.com/doonny/PipeCNN/tree/master/documents).
