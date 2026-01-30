# EMPOWERED Visual Companion - Specification

## Overview

This is an interactive visual learning companion website for "EMPOWERED: Ordinary People, Extraordinary Products" by Marty Cagan and Chris Jones.

## Book Information

- **Title**: EMPOWERED: Ordinary People, Extraordinary Products
- **Authors**: Marty Cagan, Chris Jones
- **Publisher**: Wiley (2020)
- **Genre**: Business/Strategy (viz-business)
- **Structure**: 10 Parts, 81 Chapters

## Output Structure

```
empowered-visual/
├── src/
│   ├── pages/
│   │   └── index.astro              # Custom landing page
│   ├── content/docs/
│   │   ├── overview.mdx             # Book overview
│   │   ├── chapters/
│   │   │   ├── part-01-lessons/     # Part I chapters
│   │   │   ├── part-02-coaching/    # Part II chapters
│   │   │   ├── part-03-staffing/    # Part III chapters
│   │   │   ├── part-04-vision/      # Part IV chapters
│   │   │   ├── part-05-topology/    # Part V chapters
│   │   │   ├── part-06-strategy/    # Part VI chapters
│   │   │   ├── part-07-objectives/  # Part VII chapters
│   │   │   ├── part-08-casestudy/   # Part VIII chapters
│   │   │   ├── part-09-collaboration/ # Part IX chapters
│   │   │   └── part-10-transformation/ # Part X chapters
│   │   ├── concepts/
│   │   │   ├── empowered-teams.mdx
│   │   │   ├── coaching-framework.mdx
│   │   │   ├── product-model.mdx
│   │   │   ├── team-topology.mdx
│   │   │   ├── product-vision.mdx
│   │   │   ├── okr-framework.mdx
│   │   │   ├── transformation.mdx
│   │   │   └── leadership.mdx
│   │   └── paths/
│   │       ├── product-leader.mdx    # Beginner
│   │       ├── team-builder.mdx      # Intermediate
│   │       └── transformer.mdx       # Advanced
│   └── styles/
│       └── custom.css
├── astro.config.mjs
├── package.json
├── spec.md
└── eval.md
```

## Core Concepts Visualized

| Concept | Diagram Type | Color Treatment |
|---------|--------------|-----------------|
| Empowered Teams vs Feature Teams | 2x2 Matrix | Green (empowered) vs Red (feature) |
| Coaching Framework | Decision Tree | Blue (process), Green (outcomes) |
| The Product Model | Value Chain | Blue (activities), Green (value) |
| Team Topology | Architecture Diagram | Blue (platform), Green (experience) |
| Product Vision Cascade | Hierarchy Flowchart | Purple (vision) → Blue (strategy) → Green (tactics) |
| OKR Framework | Barbell Structure | Green (objectives), Blue (key results) |
| Transformation Journey | Timeline Flow | Blue (before), Yellow (during), Green (after) |
| Leadership | Mindmap | Purple (leadership), Blue (management) |

## Visual Identity

- **Central Metaphor**: Missionaries (empowered) vs Mercenaries (feature teams)
- **Color Palette**: viz-business standard
  - Green (#4ade80): Empowered/good/recommended
  - Red (#f87171): Feature teams/avoid/risk
  - Blue (#60a5fa): Current state/information
  - Purple (#a78bfa): Vision/future
  - Yellow (#fbbf24): Highlights/neutral
- **Landing Quote**: "Leadership is about recognizing that there's a greatness in everyone, and your job is to create an environment where that greatness can emerge."

## Dependencies

| Dependency | Version | Purpose |
|------------|---------|---------|
| astro | ^5.0.0 | Static site framework |
| @astrojs/starlight | ^0.32.0 | Documentation theme |
| astro-mermaid | ^0.3.0 | Mermaid diagram rendering |
| mermaid | latest | Diagram library |

## Tech Stack

- **Framework**: Astro 5 with Starlight theme
- **Diagrams**: Mermaid via astro-mermaid integration
- **Styling**: Custom CSS with viz-business color palette
- **Fonts**: Cormorant Garamond, Inter, JetBrains Mono
