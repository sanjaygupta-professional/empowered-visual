# CLAUDE.md - Agent Instructions for empowered-visual

## Project Overview
This is a visual companion website for Marty Cagan's book "EMPOWERED: Ordinary People, Extraordinary Products". Built with Astro + Starlight, it provides interactive Mermaid diagrams and learning paths.

## Tech Stack
- **Framework**: Astro 5.x with Starlight documentation theme
- **Diagrams**: Mermaid via astro-mermaid
- **Styling**: Custom CSS in `src/styles/custom.css`
- **Content**: MDX files in `src/content/docs/`

## Directory Structure
```
src/
├── content/
│   └── docs/
│       ├── chapters/      # Chapter-by-chapter visual companions
│       │   ├── part-01-lessons/
│       │   ├── part-02-coaching/
│       │   └── ...
│       ├── concepts/      # Cross-cutting concept explanations
│       ├── paths/         # Learning paths (product-leader, team-builder, transformer)
│       └── overview.mdx   # Main landing page
├── pages/
└── styles/
```

## Commands
```bash
npm run dev      # Start dev server
npm run build    # Build for production (quality check)
npm run preview  # Preview production build
```

## Content Conventions
- Each chapter has an `overview.mdx` as entry point
- Mermaid diagrams use the custom color palette from spec.md
- Use `:::note`, `:::tip`, `:::caution` for callouts
- Learning paths link to relevant chapters, not duplicate content

## Patterns Discovered
<!-- Agent-discovered patterns will be added below -->

## Gotchas
<!-- Agent-discovered gotchas will be added below -->
- Mermaid diagrams must be in ```mermaid code blocks, not MDX components
- Large diagrams may need `%%{init: {'theme': 'base'}}%%` for consistent rendering
