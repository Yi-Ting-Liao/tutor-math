---
name: math-worksheet-transcriber
description: Convert selected textbook math problems into math worksheet markdown. Use when asked to transcribe problem statements from images or extracted text into a target markdown file, preserve the original English wording, keep only major chapter titles such as 10-3 or 10-4, remove range-only headings such as 59-64, and ensure every requested problem is a complete standalone prompt.
---

# Math Worksheet Transcriber

## Rules
- Preserve the original English wording. Do not translate or paraphrase the problem statement.
- Keep only major chapter titles such as `## 10-3` or `## 10-4`.
- Drop range-only headings such as `### 59-64` or `### 43-46`.
- Write each requested problem as a standalone entry with a direct heading such as `### 61`.
- Duplicate shared instructions from the source under each requested problem so the prompt is complete on its own.
- Keep math expressions in inline LaTeX using `$...$`.
- Render requested hints visibly, for example with `> Hint:`.

## Workflow
1. Read the target markdown file and preserve its existing section order unless the user asks to reorganize it.
2. Identify the requested chapter title, problem numbers, and source text or image content.
3. Transcribe each requested problem with exact English wording and equations.
4. Replace any range heading with direct per-problem headings.
5. Expand shared instructions so each listed problem remains understandable after the range heading is removed.
6. Write the edited markdown to the requested worksheet file.
7. Verify numbering, chapter placement, and accidental renumbering before finishing.

## Output Pattern
```markdown
## 10-3

### 57
Show that the polar equation $r=a\sin\theta+b\cos\theta$, where $ab\ne0$, represents a circle. Find its center and radius.

### 61
Graph the polar curve. Choose a parameter interval that produces the entire curve.

$r=e^{\sin\theta}-2\cos(4\theta)$ (butterfly curve)
```
