clc;
clear;

I_Real = [142 168  177  192  213  242  272  294  326  355  379  427  456  477  495  514  525  545  590  641  672  733  803  823  863  898  942  1014  1048  1117  1142  1186  1202]
R_Real = [51 57  59  61  62  66  72  76  85  85  95  115  123  132  139  146  154  161  181  211  236  274  326  332  365  378  394  441  458  480  489  522  534]

S(1) = 32380000
I(1) = 168
R(1) = 57

beta  = 0.0778244
gamma = 0.0214859
xi    = 0.001

%DAY = 31
DAY = 365*2

N = S(1) + I(1) + R(1)

for i=1:DAY
    dS_dt = -(beta*S(i)*I(i)) / N + xi*R(i);
    dI_dt = (beta*S(i)*I(i)) / N - gamma*I(i);
    dR_dt = gamma*I(i) - xi*R(i);
    
    S(i+1) = S(i) + dS_dt;
    I(i+1) = I(i) + dI_dt;
    R(i+1) = R(i) + dR_dt;
end

hold on
grid on

xlim([1 DAY+1])

%plot(I_Real)
%plot(R_Real)

plot(S)
plot(I)
plot(R)

title('Covid-19 SIRS Model (Jateng)')
xlabel('Day')
ylabel('Population')
legend('Suspectible','Infectious','Recovered')
%legend('I Real', 'R Real', 'I Prediction', 'R Prediction')