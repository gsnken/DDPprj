Fortune Prediction Shiny App
========================================================

We have built a fortune prediction algorithm.


The idea is to demonstrate interaction between UI on an html page and a server running R code.
## Files in this directory
ui.R is the user interface file.
shiny.R is the code that runs on the server.
This is the Read me file.

## What the program does
We have a model to predict the Health, Wealth and Romance for a person. Each outcome is categorical and has 5 categories.


The predictors are either -
- Birth month and date range of a person (indicating sun sign)
- Or initials of a person (indicating moon sign in some cultures)
The date is also taken into consideration.
Some amount of random error is also used to adjust for unknowns giving variation within the sun sign and moon sign.

## Inputs
The program takes five inputs -
- A radio button to chose between prediction by date / prediction by name or seeking help
- If the user chooses prediction by date, the input panel accordingly requests only birth date and birth month.
- If the user chooses prediction by name, the input panel shows only Initials inputs
- If the user seeks help, no inputs are requested and the help is displyed in the main window.

## Outputs
The inputs are reflected back to the user in the raw form.
The prediction based on the user's inputs are displyed. - These are valid only for that day.
