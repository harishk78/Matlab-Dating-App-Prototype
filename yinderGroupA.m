load('users.mat'); % This loads the users.mat file 
 
runLoop= true;  % This variable will allow the while loop to function 

while runLoop % The while loop will run until the condition is false it allows users to retry after getting a match or decling all of them


u= userDataFinal(); %calls function which shows menu and allows user input

%counter for going through the generated users and filtered struct holds
%structs that are a match
counter= 0;
filtered=  struct('name','','age',[],'gender','','field_of_study','',...
		 'region','','chill_spot','','genre','','min_age',[],...
		 'max_age',[],'pref_gender','');

%empty variable which sorts the compatibility score so that most
%compatabile matches are first 
compScore= [];

%for loop runs through all the matches and picks the most compatible ones
for i= 1:length(matches)
   m= compatability(u,matches(i));

   %if compatability is greater than 2 that means they are a match and get
   %added to struct
   if m>=2
       counter= counter+1;
       compScore(counter)= m;
       filtered(counter)= matches(i);
   end

end

%if counter isnt zero that means there are matches so the program will
%proceed to sort and output the matches to the user
if counter ~= 0

%sorting algorithm placing most relevant matches first
for i= 1:numel(filtered)
    for j= i+1:numel(filtered)
        if compScore(i) < compScore(j)
            temp= filtered(i);
            filtered(i)=filtered(j);
            filtered(j)= temp;
            temp2= compScore(i);
            compScore(i)= compScore(j);
            compScore(j)= temp2;
        end
    end

end


userInput= false; 
i= 1;
%while loop prints out all matches until user accepts one or they are out
%of matches to go through
while ~userInput && i<=length(filtered)

    fprintf('\nMatch #%d:\n', i);
    fprintf(['Name: %s\nAge: %d\nGender: %s\nField of Study: %s\nRegion: %s\n' ...
            'Favorite Chill Spot: %s\nFavorite Genre: %s\n'],filtered(i).name,...
            filtered(i).age,filtered(i).gender,filtered(i).field_of_study,...
            filtered(i).region,filtered(i).chill_spot,filtered(i).genre);
    fprintf('Your Compatability score is a %d!\n',compScore(i));

    userInput= input('To accept the match Press 1, otherwise press 0: ');

    while (userInput ~= 1) && (userInput ~= 0)
        userInput= input('Invalid input. To accept the match Press 1, otherwise press 0: ');
    end

    i= i+1;
end

else fprintf('\nSorry! But there is no matches available for you at this moment :(')

end

%this adds the user input into the matches file so that the user is now
%added into the database so that future users can match with them
matches(length(matches)+1)= u;

%asks user if they want to go again
    runLoop= input('\nTo Run Yinder one more time, press 1. To end Yinder press 0. Your Choice: ');

    while (runLoop ~= 1) && (runLoop ~= 0)
        runLoop= input('Invalid input.To Run Yinder one more time, press 1. To end Yinder press 0. Your Choice: ');
    end

   
end

%this will save all the users along with the new people from the user input
fprintf('\nThank you for choosing Yinder!')
save('users.mat','matches','-append');
