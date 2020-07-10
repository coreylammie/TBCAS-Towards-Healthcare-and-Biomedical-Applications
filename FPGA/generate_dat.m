caffe.set_mode_cpu();

% Replace with name from PytorchToCaffe
name = 'test';

model = fprintf('%s.prototxt', name);
weights = fprintf('%s.caffemodel', name);
net = caffe.Net(model, weights, 'test');

% Replace with the models' network structure
netparams = {{net.params('conv1',1).get_data(),net.params('conv1',2).get_data()}, ...
			{net.params('conv2',1).get_data(),net.params('conv2',2).get_data()}, ...
			{net.params('conv3',1).get_data(),net.params('conv3',2).get_data()}, ...
			{net.params('conv4',1).get_data(),net.params('conv4',2).get_data()}, ...
			{net.params('conv5',1).get_data(),net.params('conv5',2).get_data()}, ...
			{net.params('fc6',1).get_data(),net.params('fc6',2).get_data()}, ...
			{net.params('fc7',1).get_data(),net.params('fc7',2).get_data()}, ...
			{net.params('fc8',1).get_data(),net.params('fc8',2).get_data()}};

WeightWidth    = [ 8;  8;  8;  8;  8;  8;  8;  8];
WeightFrac     = [ 8;  8;  8;  8;  8; 11; 10; 10];

MathType   = fimath('RoundingMethod', 'Nearest', 'OverflowAction', 'Saturate', 'ProductMode', 'FullPrecision', 'SumMode', 'FullPrecision');

for i=1:numel(netparams)
  WeightType{i}  = numerictype('Signed',1, 'WordLength', WeightWidth(i), 'FractionLength', WeightFrac(i));
  weight{i}  = fi(netParams.netparams{i}{1}, WeightType{i}, MathType);
  bias{i}    = fi(netParams.netparams{i}{2}, WeightType{i}, MathType);
end

fid = fopen(fprintf('%s.dat', name), 'w');
for i=1:numel(netparams)
  fwrite(fid, storedInteger(weight{i}), 'int8');
  fwrite(fid, storedInteger(bias{i}), 'int8');
end
fclose(fid);
