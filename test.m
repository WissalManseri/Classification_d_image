clear all
clc
%Charger les images d�entra�nement et de test
img_train = imread('formes_train.jpg');
img_test = imread('formes_test.jpg');
% Convertir les images en niveaux de gris
img_train = rgb2gray(img_train);
img_test = rgb2gray(img_test);
% Appliquer la transform�e en ondelettes de Haar sur les images d�entra�nement
[c, l] = wavedec2(img_train, 2, 'haar');
% S�lectionner les coe� cients d�ondelettes les plus signi�catifs
seuil = 0.05 * max(abs(c(:)));
c_fltre = c .* (abs(c) > seuil);
% Reconstruire l�image � partir des coe� cients �ltr�s
img_train_fltre = waverec2(c_fltre, l, 'haar');
% Extraire les caract�ristiques des formes � partir des images �ltr�es
stats = regionprops(img_train_fltre > 0.5, 'Area', 'Perimeter', 'BoundingBox');
% Enregistrer les caract�ristiques dans une matrice de donn�es
X = [vertcat(stats.Area), vertcat(stats.Perimeter)];
% Appliquer la m�me proc�dure pour les images de test
[c_test, l_test] = wavedec2(img_test, 2, 'haar');
c_test_fltre = c_test .* (abs(c_test) > seuil);
img_test_fltre = waverec2(c_test_fltre, l_test, 'haar');
stats_test = regionprops(img_test_fltre > 0.5, 'Area', 'Perimeter');
X_test = [vertcat(stats_test.Area), vertcat(stats_test.Perimeter)];
% E�ectuer une classi�cation KNN sur les donn�es d�entra�nement et de test
mdl = fitcknn(X, [ones(5,1);2*ones(5,1)], 'NumNeighbors', 3);
labels = predict(mdl, X_test);
% A� cher les images de test avec les �tiquettes pr�dites
figure;
subplot(1,2,1), imshow(img_test), title('Image originale');
subplot(1,2,2), imshow(img_test_fltre), title('Image fltree');
text(10, 10, sprintf('Etiquettes predites: %d %d %d %d %d', labels), 'Color','r');
