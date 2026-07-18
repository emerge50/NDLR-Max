# NDLR Max

Adaptation du séquenceur NDLR réalisée dans Max, avec génération harmonique,
Pad, Drone, Motifs, Voice Grouping, inversions et matrice de modulation.

![NDLR Max](https://github.com/user-attachments/assets/5aebefb7-a347-4a82-bf6c-ea157c3d3176)

## Ouvrir le projet

1. Installer Max.
2. Ouvrir `ndlr_max.maxproj`.
3. Ouvrir `patchers/ndlr_main.maxpat` si le patch principal ne s'affiche pas automatiquement.

## Structure

- `patchers/` : patchers et abstractions Max.
- `code/` : moteurs et interfaces JavaScript.
- `data/` : bibliothèques rythmiques, motifs et données partagées.
- `media/` : ressources graphiques.

Les applications autonomes et fichiers `.mxf` sont des artefacts de build et
ne sont pas versionnés. Ils pourront être distribués dans les GitHub Releases.
