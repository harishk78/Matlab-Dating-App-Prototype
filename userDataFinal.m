function user_info= userDataFinal() % This function will get all the information from the user 

% Display the message box that says WELCOME
msgbox('WELCOME TO YINDER');
pause(2); %pauses the welcome message box for 3 second before the menu appers

% Changing the menu design and stylling
set(groot, 'defaultUicontrolBackgroundColor', [1,0.75,0]);
set(groot,'defaultUicontrolFontName','Times New Roman','defaultUicontrolFontSize',23,...
    'defaultUicontrolFontWeight','light','defaultUicontrolFontAngle','oblique');
set(groot, 'defaultUicontrolForegroundColor', [1,1,1]);
set(groot, 'defaultFigureColor', [0, 0, 0]);

% These are the buttons the user can press on the menu for providing their
% information
info= ["Name","Age","Gender","Field of Study","Region","Chill Spot","Music Genre","View Characteristics","Select Preferences"];
infoPref= ["Age Range","Preferred Gender","View Preferences","Redo Characteristics","Exit"];

% These are the options the user could be for their gender 
genders=["male","female","non-binary"];

% These are the options of study the user could be interested in
study = ["stem","the arts","english","education"...
            "social science","other"];

% These are the options of regions that the user could live in
regions = ["toronto", "peel","york","halton","durham","simcoe county",...
        "waterloo region","niagara"];

% These are the options of favourite genre of music that the user into
genres= ["pop","rock","hip-hop","r&b","edm","other"];

% These are the options of favourite chill spot the user can choose from
chillSpots = ["scott library", "steacie library", "tait mckenzie",...
        "student centre", "second student centre","vari hall",...
        "york lanes", "break room", "other"];

% These are the preferred gender options
prefGenders= ["male","female","non-binary","no preference"];

% This struct will store the information that the user enters for their
% preferences 
user_info= struct('name','','age',[],'gender','','field_of_study','',...
                    'region','','chill_spot','','genre','','min_age',[],...
                    'max_age',[],'pref_gender','');

% The title screen of the menu is called "Your Information"
UserInfoMenu = menu('Your Information: ', info);

% As long as the user wants to enter their charactertstics the while loop
% executes 
while true
switch UserInfoMenu
    case 1
        user_info.name = input('Please enter your Name: ', 's'); % They can enter their name
    case 2
        user_info.age= input('Please enter your age: '); % They can enter their age
        while user_info.age < 18 || isnumeric(user_info) % Checks if the age is less than 18 or if it is a numeric value

        disp("Invalid age please input a valid age 18+"); % Error checking will determine whether or not to display this message
        user_info.age= input('Please enter your age: '); % It will prompt the user for the age again

        end

    case 3

        fprintf('\n- Male\n- Female\n- Non-Binary\n'); % This will display possible gender options
        g= input('Please type your gender from these three choices: ','s'); % The user will have to type their choice based on the options 

        while ~ismember(lower(g),genders) % Error checking will determine if the user enters something not listed as the three options
            
            fprintf("\nSorry! Invalid Response\n- Male\n- Female\n- Non-Binary\n"); % It prompts them with the options again
            g= input('Please select your gender from these three choices: ','s'); % It allows them to enter a new gender choice 
            
        end
            user_info.gender= lower(g);
    case 4

    for i= 1:length(study)
        fprintf('\n- %s',study(i))
    end
    s= input('\nPlease Select your field of study from the choices: ','s'); % Prompts the user to enter a field of study from the list of options

    while ~ismember(lower(s),study)
     for i= 1:length(study)
        fprintf('\n- %s',study(i))
     end
        s= input('\nPlease Select your field of study from the choices: ','s'); % Prompts the user to enter a field of study from the list of options
    end
    user_info.field_of_study= lower(s);

    case 5

     for i= 1: length(regions)
        fprintf('\n- %s',regions(i))
     end   

     r= input('\nPlease Select Your Region: ','s'); % Prompts the user to enter region 

     while ~ismember(lower(r),regions)
              for i= 1: length(regions)
                fprintf('- %s\n',regions(i))
              end   
        r= input('\nInvalid Option, Please Select Your Region from the following: ','s'); % Prompts the user to enter a region again if they entered a region not in the list of options
     end

     user_info.region= lower(r);

    case 6

    for i= 1: length(chillSpots)
        fprintf('\n- %s',chillSpots(i))
    end
    
    cs= input('\nFrom the following choices, select your favorite spot at York: ','s'); % Prompts the user to enter favourite chill spot based on the options 

    while ~ismember(lower(cs),chillSpots)

     for i= 1: length(chillSpots)
        fprintf('\n- %s',chillSpots(i))
     end  
     cs= input('From the following choices, select your favorite spot at York: ','s'); % Prompts the user to enter favourite spot at York based on the options

    end

    user_info.chill_spot=lower(cs);
    
    case 7

        fprintf('\n-Pop\n- Rock\n- Hip-Hop\n- R&B\n- EDM\n- Other\n') % Displays the options for favourite genre of music
        gen= input('Please type your favorite genre: ','s'); % Prompts the user to enter their favourite genre based on the options

        while ~ismember(lower(gen),genres)
            fprintf('\n1. Pop\n2. Rock\n3. Hip-Hop\n4. R&B\n5. EDM\n6. Other\n') % This will display options the user can choose from
            gen= input('Please type your favorite genre: ','s'); % Prompts the user for favorite genre of music
        end

        user_info.genre= lower(gen);

    case 8
    % Displays the name, age, gender, field of study, region, chill spot,
    % and music genre that the user enters 
        fprintf(['\nName: %s\nAge: %d\nGender: %s\nField of Study: %s' ...
            '\nRegion: %s\nChill Spot: %s\nGenre: %s'],user_info.name,user_info.age,user_info.gender,...
            user_info.field_of_study,user_info.region,user_info.chill_spot,user_info.genre);
    case 9
       
        if(strcmpi(user_info.name,'')) || strcmpi(user_info.gender,'') || isempty(user_info.age) % This will check if the user filled out required fields such as name, age, gender
            
            disp("In order to proceed, you must have the name, gender, and age filled out!"); % This message will be displayed if the user tries to exit without this information filled in

        else

        fprintf('\nYou Have Exited the Informations Tab\n'); % If they exit with having name, age, and gender filled out this message will be displayed
        break;

        end

        otherwise   
            disp("Thank you for choosing Yinder!"); % This message will be displayed 
            break;
end
   UserInfoMenu = menu('Your Information: ', info);


end


infoPrefMenu= menu('Select your preferences',infoPref); % This is a button that will allow the user to select their preferences
while true
    switch infoPrefMenu
        case 1
            
        user_info.min_age= input('Please enter your preferred minimum age: '); % Prompts user for min age they would want to date

        while user_info.min_age < 18 % Checks if the users min age they want to date is less than 18

        disp("Invalid age please input a valid age 18+"); % If their age is less than 18 this error message will be displayed
        user_info.min_age= input('Please enter your preferred minimum age: '); % Asks them to enter another min age 

        end

        user_info.max_age= input('Please enter your preferred maximum age: '); %Prompts user for max age they would want to date

        while user_info.max_age <user_info.min_age %This will check if the max age they want to date is less than the min age they want to date
             disp("Invalid age must be lower than the minimum age and 18+"); % This message will be displayed if the while condition is true
             user_info.max_age= input('Please enter your preferred maximum age: '); % Prompts the user to enter preferred max age
        end

        case 2

            for i= 1: length(prefGenders) % Iterates through all prefered gender options 
                fprintf('- %s\n',prefGenders(i))
            end

           pg= input('\nFrom the following options, please select your preferred gender: ','s'); % Prompts the user for their preferred gender

           while ~ismember(lower(pg),prefGenders)
            

            for i= 1: length(prefGenders) % Iterates through all prefered gender options 
                fprintf('- %s\n',prefGenders(i))
            end

           pg= input('Sorry! Invalid option, please select your preferred gender: ','s'); % If the preferred gender is not in the list of preferred genders the user will be asked to enter another preferred gender

           end

           user_info.pref_gender= lower(pg);

        case 3
            fprintf('\nMinimum Age: %d\nMaximum Age: %d\nPreferred Gender: %s\n',user_info.min_age,user_info.max_age,user_info.pref_gender); % This will display the min age, max age, and preferred gender that the user entered 
        case 4
             user_info=userDataFinal(); % This information will be stored in the program 
             break;
        case 5
            disp("You have exited the preferences tab"); % This message will display when the user exits the preferences tab 
            break;

        otherwise
            disp("Thank you for choosing Yinder!"); % This message will be displayed 
            break;
    end
        infoPrefMenu= menu('Select your preferences',infoPref);
end

end



