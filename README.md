# NDLR Max

Adaptation du séquenceur NDLR réalisée dans Max, avec génération harmonique,
Pad, Drone, Motifs, Voice Grouping, inversions et matrice de modulation.

<img width="1301" height="932" alt="Capture d’écran 2026-07-18 à 10 39 24" src="https://github.com/user-attachments/assets/b3ff6137-811c-41a5-abda-9e4d4ac7a17f" />


## Ouvrir le projet

1. Installer Max.
2. Ouvrir `NDLR-Max.maxproj`.
3. Ouvrir `patchers/ndlr_main.maxpat` si le patch principal ne s'affiche pas automatiquement.

## Structure

- `patchers/` : patchers et abstractions Max.
- `code/` : moteurs et interfaces JavaScript.
- `data/` : bibliothèques rythmiques, motifs et données partagées.
- `media/` : ressources graphiques.

Les applications autonomes et fichiers `.mxf` sont des artefacts de build et
ne sont pas versionnés. Ils pourront être distribués dans les GitHub Releases.
