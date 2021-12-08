robot = legoev3('usb');

leftMotor = motor(robot, 'A');
rightMotor = motor(robot, 'B');

sonar = sonicSensor(robot);

moveSpeed = 30;
leftMotor.Speed = moveSpeed;
rightMotor.Speed = moveSpeed;

start(leftMotor);
start(rightMotor);

while(1)
    distance = readDistance(sonar);

    command = "n";
    if (distance < 0.2)
        stop(leftMotor);
        stop(rightMotor);
        [v, ~, ~] = takeImageAndGetVect;
        y = net(v);
        command = getDirectionFromVect(y);
        %command = input("what?", 's'); % Process the image
    end

    if (command == "n")
        start(leftMotor);
        start(rightMotor);
    elseif (command == "l")
        stop(leftMotor);
        start(rightMotor);
        pause(1.63);
    elseif (command == "r")
        start(leftMotor);
        stop(rightMotor);
        pause(1.63);
    else
        pause(0.01);
    end
end