%% seul2quat
clc

ypr = rand(1,3)

q1 = eul2quat(ypr,'ZYX')
q2 = seul2quat(ypr,'ZYX')

e1 = quat2eul(q1)
e2 = squat2eul(q2)

%% quatmultiply
clc

q = [1 0 1 0];
r = [1 0.5 0.5 0.75; 2 1 0.1 0.1];

mult = quatmultiply(q, r)
mult = squatmultiply(q, r)


%% Quatnorm, normalize, modulus, inverse
clc

q = rand(40,4);
[squatnorm(q) quatnorm(q)]
[squatnormalize(q) squatnormalize(q)]
[squatmod(q) quatmod(q)]
[squatinv(q) quatinv(q)]

%% squat2rotm
clc
q = (rand(1,4));

quat2rotm(q)
squat2rotm(q)

%% squatrotate
clc
q = (rand(1,4));
r = [1 1 1];

quatrotate(q,r)
squatrotate(q,r)




