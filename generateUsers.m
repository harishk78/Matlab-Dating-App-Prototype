function users= generateUsers() % This function generates the user preferences that they enter 
% The struct stores the user preferences. Users will have to enter in all these charactersitcs about themselves 
    users= struct('name','','age',[],'gender','','field_of_study','',...
		 'region','','chill_spot','','genre','','min_age',[],...
		 'max_age',[],'pref_gender','');

% These names are stored in the dating app database 
    names= ["emma", "liam", "olivia", "noah", "ava", "ethan", "isabella",...
        "sophia", "mia", "jackson", "lucas", "aiden", "elijah", "logan",...
        "caden", "grayson", "harper", "avery", "evelyn", "mason", "dale",...
        "palmer", "paige", "aguilar", "juliet", "hopkins", "william",...
        "blair", "hannah", "baker", "roxanne", "holland", "mandy", "woods",...
        "rita", "kelley", "pearl", "cobb", "barrett", "jackson", "bruno",...
        "skye", "sirena", "xia gui", "wan", "zhu", "kong", "enlai", "duan",...
        "shi", "gao", "chunhua"];
% Creates random length of names. 
    users.name= names(randi(length(names)));
% The users ages are a random number between 18 and 26
    users.age= randi([18,26]);
% Stores the possible gender options
    genders=["male","female","non-binary"];
% Creates random length of genders.     
    users.gender= genders(randi(length(genders)));
% Stores the possible study options 
    study = ["stem","the arts","english","education"...
            "social science","other"];
% Creates random length of the study option
    users.field_of_study= study(randi(length(study)));
%Stores the possible region options where the user lives 
regions = ["toronto", "peel","york","halton","durham","simcoe County",...
        "waterloo region","niagara"];
% Creates a random length of the region 
    users.region= regions(randi(length(regions)));
% Stores the possible chill spots the users can choose from as their favourite spot 
    chillSpots = ["scott library", "steacie library", "tait mckenzie",...
        "student centre", "second student centre","vari hall",...
        "york lanes", "break room", "victor dahdaleh building",...
        "engineering building", "william small centre"];
% Creates a random length of the chillspot    
    users.chill_spot= chillSpots(randi(length(chillSpots)));

% The minimum and maximum value is a number between 18 and 26    
    min= randi([18,26]);
    max= randi([18,25]);
% If the maximum age is smaller than the minimum age then the program will
% generate a max value between 18 and 26 
    while max<min
        max= randi([18,26]); 
    end

% The users smallest age they want to date and the users largest age they
% want to date
    users.min_age= min;
    users.max_age= max;
% Stores possible options for the users prefered gender     
    prefGenders= ["male","female","non-binary","no preference"];
    users.pref_gender= prefGenders(randi(length(prefGenders)));
%Stores possible options for favourite genre of music
    genres= ["pop","rock","hip-hop","r&b","edm","other"];
    users.genre= genres(randi(length(genres)));

end