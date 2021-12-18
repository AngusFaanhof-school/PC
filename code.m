% Load the trained neural network
net = load("trainNN.mat");

% Define and start the video stream
vid = videoinput('winvideo', 1);
start(vid);

% Define the robot and objects
robot = legoev3('usb');
leftMotor = motor(robot, 'A');
rightMotor = motor(robot, 'B');
sonar = sonicSensor(robot);

% Assign movementSpeed to the motors
moveSpeed = 30;
leftMotor.Speed = moveSpeed;
rightMotor.Speed = moveSpeed;

while(1)
    % Drive forward by default
    start(leftMotor);
    start(rightMotor);
    command = "g";

    % Read distance in front
    distance = readDistance(sonar);

    if (distance < 0.2)
        % Stop if the distance is too small
        stop(leftMotor);
        stop(rightMotor);

        % Wait to get into position
        pause(1);

        % Take the image and get the image vector
        imageVector =  takeImageAndGetVect(vid);

        % Get the resultVector from the neural network
        resultVector = net(imageVector);

        % Get the command from the resultVector
        command = getCommandFromVector(resultVector);
    end


    if (command == "g")
        % Continue after 10 ms
        pause(0.01);
    elseif (command == "l")
        % Hard coded left turn
        start(rightMotor);
        pause(1.63);
        stop(rightMotor);
    elseif (command == "r")
        % Hard coded right turn
        start(leftMotor);
        pause(1.63);
        stop(leftMotor);
    end
end