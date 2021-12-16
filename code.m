% Define and start the video stream
vid = videoinput('winvideo',1);
start(vid);

% Load the trained neural network
net = load("trainNN.mat");

% Define the robot objects
robot = legoev3('usb');
leftMotor = motor(robot, 'A');
rightMotor = motor(robot, 'B');
sonar = sonicSensor(robot);

% Assign movementSpeed to the motors
moveSpeed = 30;
leftMotor.Speed = moveSpeed;
rightMotor.Speed = moveSpeed;

while(1)
    % Read distance in front
    distance = readDistance(sonar);

    % Drive by default
    start(leftMotor);
    start(rightMotor);

     % Go by default
    command = "g";

    if (distance < 0.2)
        stop(leftMotor);
        stop(rightMotor);

        % Wait so we can get in position
        pause(1);

        % Take the image
        imageVector =  takeImageAndGetVect(vid);

        % Get the resultVector from the neural network
        resultVector = net(imageVector);

        % Get the command from the resultVector
        command = getCommandFromVector(resultVector);
    end


    if (command == "g")
        % Continue but wait 10 ms
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