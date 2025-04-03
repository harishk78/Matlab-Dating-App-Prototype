function val= compatability(user1, user2) % This function gets two users as input and returns the compatibility score for both users
% Compatability score and the value variable are set to zero to begin with
    compatabilityScore=0; 
    val= 0;

    % Stores an array of preferred gender options that the user chooses from 
    prefGenders= ["male","female","non-binary","no preference"];

    % This checks for age compatibility 
    if(user1.min_age <= user2.age && user1.max_age >= user2.age) && (user2.min_age <= user1.age && user2.max_age >= user1.age)
        compatabilityScore= compatabilityScore+1;
    end

    % This checks for gender preference comptability 
    if (strcmpi(user1.pref_gender,prefGenders(4))) && (strcmpi(user2.pref_gender,prefGenders(4)) || strcmpi(user1.gender,user2.pref_gender))
           compatabilityScore=compatabilityScore+1;

    elseif (strcmpi(user2.pref_gender,prefGenders(4))) && (strcmpi(user1.pref_gender,prefGenders(4)) || strcmpi(user2.gender,user1.pref_gender))
           compatabilityScore=compatabilityScore+1;

    elseif (strcmpi(user1.gender,user2.pref_gender)) && (strcmpi(user2.gender,user1.pref_gender))
        compatabilityScore= compatabilityScore+1;
    end

    % If the compatibility score is at least two check the compatability in
    % other preferences such as field of study, region, favourite chill spot, genre and add one to the score.  
 
    if compatabilityScore>=2
        
        if strcmpi(user1.field_of_study,user2.field_of_study)
            compatabilityScore= compatabilityScore+1;
        end

        if strcmpi(user1.region,user2.region)
            compatabilityScore= compatabilityScore+1;
        end              

        if strcmpi(user1.chill_spot,user2.chill_spot)
            compatabilityScore= compatabilityScore+1;
        end

        if strcmpi(user1.genre,user2.genre)
            compatabilityScore= compatabilityScore+1;
        end

    end
        
    % Sets the final value of the score equal to the compatability score
    % and returns the value 
    val= compatabilityScore;

end


