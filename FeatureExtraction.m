%% UCI data generation

'generating data using UCI dataset';

%% set parameters

segment_length = 200;
test_user_ids = 14:17;
use_pca_features = false;
pca_k = 26;

strcat('segment lenght: ', num2str(segment_length))

%% open file and read raw data

'loading the data';
for j = 11 : 17
    filename = strcat('realistic_sensor_displacement/subject',num2str(j));
    
    filename = strcat(filename,'_ideal.log');
    [fid, msg] = fopen(filename, 'rt');
    if fid < 0
        error('Failed to open file "%s" because "%s"', filename, msg);
    end
    A=[];
    %%fid = fopen('realistic_sensor_displacement/subject',num2str(i),'.txt');
    [A,delimiterOut]=importdata(filename);
    %%A = (textscan(fid, '%d%s%d%f%f%f', 'delimiter', ','));
    fclose(fid);%% extract data about activity type, x- , y- , and z-acceleration
    
    arr1_x =[];
	arr1_y =[];
	arr1_z =[];
 
	arr2_x =[];
	arr2_y =[];
	arr2_z =[];

	arr3_x =[];
	arr3_y =[];
	arr3_z =[];

	arr4_x =[];
	arr4_y =[];
	arr4_z =[];

	arr5_x =[];
	arr5_y =[]
	arr5_z =[]

	arr6_x =[]
	arr6_y =[]
	arr6_z =[]

	arr7_x =[]
	arr7_y =[]
	arr7_z =[]

	arr8_x =[]
	arr8_y =[]
	arr8_z =[]

	arr9_x =[]
	arr9_y =[]
	arr9_z =[]
	

    
    arr1_x = A(:,3);  
    arr1_y = A(:,4);	
    arr1_z = A(:,5);	

    arr2_x = A(:,16);  
    arr2_y = A(:,17);  
    arr2_z = A(:,18);  

    arr3_x = A(:,29);   
    arr3_y = A(:,30);   
    arr3_z = A(:,31);   

    arr4_x = A(:,42);
    arr4_y = A(:,43);
    arr4_z = A(:,44);

    arr5_x = A(:,55);  
    arr5_y = A(:,56);	 
    arr5_z = A(:,57);	 

    arr6_x = A(:,68);  
    arr6_y = A(:,69);  
    arr6_z = A(:,70);  

    arr7_x = A(:,81);   
    arr7_y = A(:,82);	
    arr7_z = A(:,83);	

    arr8_x = A(:,94);
    arr8_y = A(:,95);
    arr8_z = A(:,96);

    arr9_x = A(:,107);  
    arr9_y = A(:,108);	
    arr9_z = A(:,109);	

	arr_activities = []
	
    arr_activities = A(:,120);
    
    %% find array indexes when user activity type changes

	arr_shift = arr_activities;
	arr_shift(end + 1) = arr_activities(1);
	arr_shift(1) = [];

	
	idx_shuffled = [1; find(arr_activities ~= arr_shift) + 1];
	idx_shuffled(end) = size(arr_activities, 1);
	
	%% form the dataset
	
	'generating new dataset';
	
	sample_size = size(arr_activities, 1);
	
	x1 = [];
	y1 = [];
	z1 = [];
	
	x2 = [];
	y2 = [];
	z2 = [];
	
	x3 = [];
	y3 = [];
	z3 = [];
	
	x4 = [];
	y4 = [];
	z4 = [];
	
	x5 = [];
	y5 = [];
	z5 = [];
	
	x6 = [];
	y6 = [];
	z6 = [];
	
	x7 = [];
	y7 = [];
	z7 = [];
	
	x8 = [];
	y8 = [];
	z8 = [];
	
	x9 = [];
	y9 = [];
	z9 = [];
	
	basic_features = [];
	idx_training = [];
	
	for i = 1:size(idx_shuffled, 1) - 1
	    
	    k = idx_shuffled(i);
	        
	    while k + segment_length < idx_shuffled(i + 1) 
	        
	        idx_training = [idx_training; [k:(k + segment_length - 1)]];
	        
	        x1_add = arr1_x(k:(k + segment_length - 1))';
	        y1_add = arr1_y(k:(k + segment_length - 1))';
	        z1_add = arr1_z(k:(k + segment_length - 1))';
	
	        x2_add = arr2_x(k:(k + segment_length - 1))';
	        y2_add = arr2_y(k:(k + segment_length - 1))';
	        z2_add = arr2_z(k:(k + segment_length - 1))';
	
	        x3_add = arr3_x(k:(k + segment_length - 1))';
	        y3_add = arr3_y(k:(k + segment_length - 1))';
	        z3_add = arr3_z(k:(k + segment_length - 1))';
	
	        x4_add = arr3_x(k:(k + segment_length - 1))';
	        y4_add = arr3_y(k:(k + segment_length - 1))';
	        z4_add = arr3_z(k:(k + segment_length - 1))';
	
	        x5_add = arr3_x(k:(k + segment_length - 1))';
	        y5_add = arr3_y(k:(k + segment_length - 1))';
	        z5_add = arr3_z(k:(k + segment_length - 1))';
	
	        x6_add = arr3_x(k:(k + segment_length - 1))';
	        y6_add = arr3_y(k:(k + segment_length - 1))';
	        z6_add = arr3_z(k:(k + segment_length - 1))';
	
	        x7_add = arr3_x(k:(k + segment_length - 1))';
	        y7_add = arr3_y(k:(k + segment_length - 1))';
	        z7_add = arr3_z(k:(k + segment_length - 1))';
	
	        x8_add = arr3_x(k:(k + segment_length - 1))';
	        y8_add = arr3_y(k:(k + segment_length - 1))';
	        z8_add = arr3_z(k:(k + segment_length - 1))';
	
	        x9_add = arr3_x(k:(k + segment_length - 1))';
	        y9_add = arr3_y(k:(k + segment_length - 1))';
	        z9_add = arr3_z(k:(k + segment_length - 1))';
	        
	        basic_features1 = []
	
	        basic_features1 = [basic_features1 Extract_basic_features(x1_add, y1_add, z1_add)];
	        basic_features1 = [basic_features1 Extract_basic_features(x2_add, y2_add, z2_add)];
	        basic_features1 = [basic_features1 Extract_basic_features(x3_add, y3_add, z3_add)];
	        basic_features1 = [basic_features1 Extract_basic_features(x4_add, y4_add, z4_add)];
	        basic_features1 = [basic_features1 Extract_basic_features(x5_add, y5_add, z5_add)];
	        basic_features1 = [basic_features1 Extract_basic_features(x6_add, y6_add, z6_add)];
	        basic_features1 = [basic_features1 Extract_basic_features(x7_add, y7_add, z7_add)];
	        basic_features1 = [basic_features1 Extract_basic_features(x8_add, y8_add, z8_add)];
	        basic_features1 = [basic_features1 Extract_basic_features(x9_add, y9_add, z9_add)];
	
	        basic_features = [basic_features; basic_features1]
	
	        k = k + segment_length/2;
	        
	    end
	    
	       
	end
	
	x1 = arr1_x(idx_training);
	y1 = arr1_y(idx_training);
	z1 = arr1_z(idx_training);
	
	x2 = arr2_x(idx_training);
	y2 = arr2_y(idx_training);
	z2 = arr2_z(idx_training);
	
	x3 = arr3_x(idx_training);
	y3 = arr3_y(idx_training);
	z3 = arr3_z(idx_training);
	
	x4 = arr4_x(idx_training);
	y4 = arr4_y(idx_training);
	z4 = arr4_z(idx_training);
	
	x5 = arr5_x(idx_training);
	y5 = arr5_y(idx_training);
	z5 = arr5_z(idx_training);
	
	x6 = arr6_x(idx_training);
	y6 = arr6_y(idx_training);
	z6 = arr6_z(idx_training);
	
	x7 = arr7_x(idx_training);
	y7 = arr7_y(idx_training);
	z7 = arr7_z(idx_training);
	
	x8 = arr8_x(idx_training);
	y8 = arr8_y(idx_training);
	z8 = arr8_z(idx_training);
	
	x9 = arr9_x(idx_training);
	y9 = arr9_y(idx_training);
	z9 = arr9_z(idx_training);
	
	raw_answers = arr_activities(idx_training(:, 1));
	user_data = user_id(idx_training(:, 1));
	
	'dataset was generated';
	
	%% transorm answers into numeric labels
	
	answ = [];
	
	for i = 1 : length(raw_answers)
	    answ = [answ; raw_answers(i)];
	end
	
	%% transform answers into vectors
	
	answ_vector = [];
	
	for i = 1 : length(answ)
	    vect = zeros(33, 1)';
	    if answ(i) ~= 0
	        vect(answ(i)) = 1;
	    end
	    answ_vector = [answ_vector; vect];
	end
	
	dlmwrite(strcat('REALDISP/answers_test_', num2str(j), '.csv'), answ_test, 'delimiter', ',')
	dlmwrite(strcat('REALDISP/answers_vectors_test_', num2str(j), '.csv'), answ_vector_test, 'delimiter', ',')
	dlmwrite(strcat('REALDISP/data_x1_test_', num2str(j), '.csv'), x1, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_y1_test_', num2str(j), '.csv'), y1, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_z1_test_', num2str(j), '.csv'), z1, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_x2_test_', num2str(j), '.csv'), x2, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_y2_test_', num2str(j), '.csv'), y2, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_z2_test_', num2str(j), '.csv'), z2, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_x3_test_', num2str(j), '.csv'), x3, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_y3_test_', num2str(j), '.csv'), y3, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_z3_test_', num2str(j), '.csv'), z3, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_x4_test_', num2str(j), '.csv'), x4, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_y4_test_', num2str(j), '.csv'), y4, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_z4_test_', num2str(j), '.csv'), z4, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_x5_test_', num2str(j), '.csv'), x5, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_y5_test_', num2str(j), '.csv'), y5, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_z5_test_', num2str(j), '.csv'), z5, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_x6_test_', num2str(j), '.csv'), x6, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_y6_test_', num2str(j), '.csv'), y6, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_z6_test_', num2str(j), '.csv'), z6, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_x7_test_', num2str(j), '.csv'), x7, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_y7_test_', num2str(j), '.csv'), y7, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_z7_test_', num2str(j), '.csv'), z7, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_x8_test_', num2str(j), '.csv'), x8, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_y8_test_', num2str(j), '.csv'), y8, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_z8_test_', num2str(j), '.csv'), z8, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_x9_test_', num2str(j), '.csv'), x9, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_y9_test_', num2str(j), '.csv'), y9, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/data_z9_test_', num2str(j), '.csv'), z9, 'delimiter', ',', 'precision', 4)
	dlmwrite(strcat('REALDISP/basic_9features_test_', num2str(j), '.csv'), basic_features_test, 'delimiter', ',', 'precision', 4);

		
end


