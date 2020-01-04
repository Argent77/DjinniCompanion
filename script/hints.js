// Supported languages
var LANG_EN = "en";
var LANG_DE = "de";
var LANG_FR = "fr";

// definition of hints for supported languages
var hintTable = [];
hintTable[LANG_EN] = 
[
  "Right-click on Afaaq's scimitar to change its behavior. This might be useful for certain enemies who may react allergic to specific damage types.",
  "Let Afaaq talk to the citizens once in a while to see some useful, interesting or funny dialogs.",
  "You can use Afaaq's quick menu to access a variety of specific actions or change his scripted behavior. It's accessible via the 'Use item' button.",
  "Try talking to the djinni lamp while the djinni is outside to see more interesting options.",
  "Take care! Putting certain quest items into Afaaq's inventory might circumvent scripted checks.",
  "You are in for a nasty surprise if you dare to equip the demi-lich skull for a longer period of time.",
  "The lone chest on a rock formation in the magma cavern below Amkethran can save you a lot of time and effort if you actually manage to access its content. ;)"
];
hintTable[LANG_DE] =
[
  "Mit einem Rechtsklick auf Afaaqs Krummsäbel könnt Ihr das Verhalten der Waffe ändern. Das kann bei Gegnern nützlich sein, die auf bestimmte Schadensarten allergisch reagieren.",
  "Nutzt die Gelegenheit und lasst Afaaq hin und wieder mit den Stadtbewohnern reden, um ein paar nützliche, interessante oder witzige Dialoge zu sehen.",
  "Afaaqs Schnellzugriff ermöglicht es Euch, spezielle Aktionen durchzuführen oder sein Angriffsskript zu ändern. Ihr könnt es über die 'Gegenstand benutzen'-Schaltfläche erreichen.",
  "Versucht mal mit der Dschinnlampe zu reden, während sich Afaaq nicht darin befindet.",
  "Vorsicht! Wenn Ihr bestimmte Quest-relevante Gegenstände in Afaaqs Gepäck ablegt, könntet Ihr geskriptete Überprüfungen umgehen.",
  "Macht Euch auf eine böse Überraschung gefasst, wenn Ihr es wagt, den Schädel des Halbleichnams für eine längere Zeit zu tragen.",
  "Die einsame Kiste auf einer Felsformation in der Magmahöhle unterhalb Amkethrans kann Euch eine Menge Zeit und Aufwand ersparen, wenn Ihr es tatsächlich schafft, an ihren Inhalt heranzukommen. ;)"
];
hintTable[LANG_FR] = 
[
  "Faites un clic droit sur le cimeterre d'Afaaq pour modifier son comportement. Cela peut être utile pour certains ennemis qui peuvent être vulnérables à des types de dégâts spécifiques.",
  "Laissez Afaaq parler aux citoyens de temps en temps pour voir des dialogues utiles, intéressants ou amusants.",
  "Vous pouvez utiliser le menu rapide d'Afaaq pour accéder à une variété d'actions spécifiques ou pour modifier son comportement de script. Il est accessible via le bouton 'Utiliser l'objet'.",
  "Essayez de parler à la lampe djinn pendant que le djinn est à l'extérieur pour voir des options plus intéressantes.",
  "Faites attention ! Le fait de mettre certains objets de quête dans l'inventaire d'Afaaq pourrait permettre de contourner les contrôles de script.",
  "Vous aurez une mauvaise surprise si vous osez équiper le crâne demi-liche pour une période de temps plus longue.",
  "Le coffre isolé sur une formation rocheuse dans la caverne de magma sous Amkethran peut vous faire gagner beaucoup de temps et d'efforts si vous parvenez à accéder à son contenu. ;)"
];

var hintIdx = 0;

// cycle through available hints of the specified language
function showNextHint(lang, textId) {
  var hints = hintTable[lang];
  if (hints.length > 0) {
    var elem = document.getElementById(textId);
    if ('textContent' in elem) {
      elem.textContent = hints[hintIdx];
    } else {
      elem.innerText = hints[hintIdx];
    }
    hintIdx = (hintIdx + 1) % hints.length;
  }
}

// display hint box and initialize first hint
function showHints(boxId, lang, textId) {
  document.getElementById(boxId).style.display = "block";
  showNextHint(lang, textId);
}
