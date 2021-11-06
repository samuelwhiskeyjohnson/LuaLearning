print("-----QUESTION 10 SOLUTION-----")
-- Find the longest first name string and print it
rutgers_asian_study_students = {
    "Karen Mask", 
    "Joey Boey", 
    "Bobby Lee", 
    "Jesus Christ", 
    "Stevenson Brown",
    "Peter parker", 
    "Takumi Fujiwara", 
    "Gangsta paradise"
}

-- helper function 1
--given inputArrayOfFull names, return arrayOfFirstNames
function filterFirstNamesGivenArrayOfFullNames( inputArrayOfFullNames )
    -- Filter out only the first names first
    local arrayOfFirstNames = {}

    -- iterate through inputArrayOfFullNames
    -- and only put first names into the arrayOfFirstNames
    -- identify the first name with space
    for indexOfArrayOfFullNames = 1, #inputArrayOfFullNames do
        local fullName = inputArrayOfFullNames[ indexOfArrayOfFullNames ]

        for indexOfCharacterInFullName = 1, string.len( fullName ) do
            -- iterate each character
            local characterInFullName = string.sub( fullName, indexOfCharacterInFullName, indexOfCharacterInFullName )

            -- if characterInFullName is space
            -- then it means index 1 to current index - 1 is the first name
            if (characterInFullName == " ") then
                local firstName = string.sub( fullName, 1, indexOfCharacterInFullName - 1 )

                -- put the firstname in seperate array
                table.insert( arrayOfFirstNames, firstName )

            end
        end
    end
    return arrayOfFirstNames
end

-- helper function 2
--given inputArrayOfFirstNames, return the longest name
function findLongestFirstNameGivenArrayOfFirstNames( inputArrayOfFirstNames )
    -- iterate the array of first names and find the max length
    local currentLongestFirstNameLength = 0
    local currentLongestFirstName = ""

    for index = 1, #inputArrayOfFirstNames do
        local firstName = inputArrayOfFirstNames[ index ]
        local lengthOfFirstName = string.len( firstName )

        if currentLongestFirstNameLength < lengthOfFirstName then
            currentLongestFirstNameLength = lengthOfFirstName
            currentLongestFirstName = firstName

        end

    end

    -- end of the loop means, you iterates thorugh all the elements in the array
    -- and found the longest first name

    return currentLongestFirstName

end

-- given array of full names, print the longest first name
function findLongestFirstNameGivenArrayOfFullNames( inputArrayOfFullNames )

    local arrayOfFirstNames = filterFirstNamesGivenArrayOfFullNames( inputArrayOfFullNames )

    -- now you just have array of first names
    for index = 1, #arrayOfFirstNames do print(arrayOfFirstNames[index]) end

    -- find the longest first name in arrayOfFirstNames
    local longestFirstName = findLongestFirstNameGivenArrayOfFirstNames( arrayOfFirstNames )

    print( longestFirstName )

end

findLongestFirstNameGivenArrayOfFullNames(rutgers_asian_study_students)

























print("REFACTORING------------")
--Problems
-- asian group element? Who cares about asian. Full name and first name is what's relevant and you should name variables revolving around full naem and first name.
--Abstraction is all over the place. The function encompasses all levels of abstraction
--Very unmodular.
--too many nestings


-- function will represent a purpose AKA specific task and a level of abstraction
-- low coupling AND high cohesion == high modularity
-- keeo your nesting maximum of 3. Preferably even 2. There are 4 nestings



-- declare and initialize a function named asian_nerd_with_longest_name with input_asian_group_array
function asian_nerd_with_longest_name( input_full_name_array )

    -- declare and initialize a variable named current_longest_asian_name_length and set it to zero
    local current_longest_asian_name_length = 0
    -- declare and initialize a variable named current_longest_asian_name and set it to nil
    local current_longest_asian_name = ""

    -- start a for loop that iterates input_asian_group_array
    for full_name_array_index = 1, #input_full_name_array do

        local fullName = input_full_name_array[ full_name_array_index ]
        local fullNameLength = string.len(fullName)
        
        -- index_of_asian_group_element is the character index
        for index_of_character_in_full_name = 1, fullNameLength do

            local each_character_in_a_name = string.sub( fullName, index_of_character_in_full_name, index_of_character_in_full_name)

            if each_character_in_a_name == " " then
                local length_of_first_name = index_of_character_in_full_name - 1

                -- SOURCE OF THE PROBLEM THE FUNCTION IS USING GLOBAL VARIABLE
                -- find_the_current_max_first_name_and_length(length_of_first_name)

                if length_of_first_name > current_longest_asian_name_length then
                    current_longest_asian_name_length = length_of_first_name
                    current_longest_asian_name = fullName
                end

            end

        end
    end

    -- print the current_longest_asian_name
    print(current_longest_asian_name)
    print(current_longest_asian_name_length)
    -- end the function    
end

asian_nerd_with_longest_name(rutgers_asian_study_students)

































--EXAMPLE WHY YOU SHOULDN'T USE GLOBAL VARIABLES IN MOST CASES
--GLOBAL VARIABLES MAKES THE CODE UNMODULAR. Why?
--PROBLEM WITH GLOBAL VARIABLES IS THAT THEY CAN BE ACCESSED ANYWHERE!!!
--input of a function should be shown as the parameter or in the same file.












--CASE 1 where persistance of data is not required AKA calling the same function multiple times, output is always the same
--CASE 1 INPUT SHOULD BE VISIBLE IN PARAMETER TO SHOW THAT FUNCTION HAS INPUT
-- AND HAVE A VARIABLE TO TAKE IN RETURNED VALUE OF FUNCTION TO SHOW THAT FUNCTION HAS OUTPUT


--CASE 1 BAD EXAMPLE
num1 = 3
num2 = 5
sum = 0


function sumTwoNumbers()
    sum = num1 + num2
    
end

--IMPLIED INPUT!! IT LOOKS LIKE THERE IS NO INPUT AND OUTPUT!!
sumTwoNumbers()




--CASE 1 GOOD EXAMPLE
function sumTwoNumbers(num1Fixed, num2Fixed)
    local sumFixed = num1Fixed + num2Fixed
    return sumFixed
    
end

local sumOfOneAndTwo = sumTwoNumbers(1,2)







--CASE 2 where persistance of data is required AKA calling the same function multiple times, output varies
--CASE 2 INPUT SHOULD BE VISIBLE IN PARAMETER OR IN THE SAME FILE SHOW THAT FUNCTION HAS INPUT
-- BUT NO NEED TO HAVE A VARIABLE TO TAKE IN RETURNED VALUE OF FUNCTION TO SHOW THAT FUNCTION HAS OUTPUT BUT THE OUTPUT VARIABLE SHOULD BE CLOSE TO THE FUNCTION


--CASE 2 BAD EXAMPLE
--lets say this is in another .lua file.
amount_of_food_in_fridge = 10




function TakeAFoodOut( inputTakeAmount )
    amount_of_food_in_fridge = amount_of_food_in_fridge - inputTakeAmount
end



TakeAFoodOut(5)





--CASE 2 GOOD EXAMPLE
--The fact the variable is declared closed to function matters. It looks like they are associated with it.
-- you do need to have the variable outside the function or else the variable is resetted to 10.
--[[ 
you want 
TakeAFoodOut2(1) to output 9
TakeAFoodOut2(1) to output 8
TakeAFoodOut2(1) to output 7

NOT
TakeAFoodOut2(1) to output 9
TakeAFoodOut2(1) to output 9
TakeAFoodOut2(1) to output 9

]]


local amount_of_food_in_fridge_fixed = 10

function TakeAFoodOut2( inputTakeAmount )
    local amount_of_food_in_fridge = amount_of_food_in_fridge - inputTakeAmount
end


TakeAFoodOut2(5)

