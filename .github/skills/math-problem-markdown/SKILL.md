---
name: math-problem-markdown
description: Convert worksheet markdown such as `caculus/YYYYMMDD/problem.md` into the project's two-column XeLaTeX worksheet file such as `problem_*.tex`. Use when asked to update or restyle math problem sheets, preserve the original English wording and math, turn chapter labels like `10-1` into section titles instead of prefixing every problem number, keep a first-page contents block with internal hyperlinks, align `(a) (b) (c)` subparts consistently, and prefer static TeX checks unless the user explicitly asks to compile.
---

# Math Problem Markdown

## Use This Skill For
- Updating a worksheet TeX file from a markdown source file in this repo.
- Reformatting existing calculus problem sheets to match the current two-column handout style.
- Adding or repairing worksheet structure such as chapter titles, contents, hyperlinks, and subpart alignment.

## Rules
- Preserve the original English problem wording and math expressions. Do not paraphrase.
- Keep chapter labels such as `10-1`, `10-2`, `10-3`, `10-4` as visible section titles, not as prefixes like `10-1.16` in every problem number.
- Keep problem numbers plain inside `\problem{...}` such as `16`, `42`, `44`.
- Maintain the worksheet's existing document class, fonts, and two-column layout unless the user asks to redesign it.
- If a first-page contents block exists or the user asks for one, keep it on the first page left column and make it link to chapter titles with `hyperref`.
- Use a shared list style for `(a) (b) (c)` parts so labels line up across problems.
- Prefer static checks only: inspect structure, braces, environments, labels, and links. Do not compile unless the user explicitly asks.

## Workflow
1. Read both the source markdown file and the target `.tex` file before editing.
2. Keep the existing page setup, font setup, and top-level worksheet wrapper unless the user requests layout changes.
3. Convert markdown chapters into TeX section titles using a helper such as `\problemtitle{sec:10-1}{10-1}`.
4. Convert each markdown problem into a standalone `\problem{...}{...}` entry.
5. Expand shared instructions into each problem when needed so the TeX problem is self-contained.
6. If the worksheet uses a contents block, update it to match the actual chapter list and problem numbers.
7. If contents links are needed, load `\usepackage[hidelinks]{hyperref}`, use `\hyperlink{...}` in the contents, and pair each chapter title with `\hypertarget{...}{}`.
8. Normalize subparts with a dedicated enumitem list definition instead of repeating ad hoc `enumerate` settings.
9. After editing, run static checks on the TeX source: verify balanced braces, chapter-title targets, contents links, problem numbering, and that no invalid commands such as `\columnbreak` remain in a plain `twocolumn` article workflow.

## TeX Patterns
- Chapter title:

```tex
\newcommand{\problemtitle}[2]{%
  \hypertarget{#1}{}%
  \par\vspace{0.4em}%
  \noindent{\large\bfseries #2}\par
  \vspace{0.3em}%
  \hrule
  \vspace{0.9em}%
}
```

- Contents block with internal links:

```tex
\newcommand{\worksheettoc}{%
  \noindent{\Large\bfseries Contents}\par
  \vspace{0.3em}%
  \hrule
  \vspace{0.9em}%
  \begin{tabular}{@{}p{0.26\columnwidth}p{0.66\columnwidth}@{}}
    \hyperlink{sec:10-1}{\textbf{10-1}} & \hyperlink{sec:10-1}{16, 17, 18, 57} \\
    \hyperlink{sec:10-2}{\textbf{10-2}} & \hyperlink{sec:10-2}{42} \\
  \end{tabular}\par
}
```

- Aligned subparts:

```tex
\newlist{subparts}{enumerate}{1}
\setlist[subparts]{%
  label=(\alph*),
  labelindent=\problemnumberwidth,
  leftmargin=*,
  labelsep=0.5em,
  align=left
}
```

## Static Check Checklist
- `\problem{...}` uses plain problem numbers, not chapter-prefixed IDs.
- Every `\hyperlink{sec:...}` has a matching `\hypertarget{sec:...}{}`.
- The contents block matches the actual chapter order and problem numbers.
- Subparts use the shared `subparts` environment consistently.
- No extra closing brace remains at the end of a `\problem{...}{...}` block.
- The first-page contents handoff uses page/column flow that is valid for the current document setup.
