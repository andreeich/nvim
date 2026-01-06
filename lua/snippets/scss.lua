local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Default transition
  s('transition', t 'transition: 0.2s ease-in-out;'),

  -- Embla styles
  s('es', {
    t {
      '.embla { overflow: hidden; }',
      '.emblaContainer { display: flex; }',
      '.emblaSlide { flex: 0 0 100%; min-width: 0; }',
    },
  }),

  -- Color variables - Text
  s('clr-text-primary', t 'var(--clr-text-primary)'),
  s('clr-text-primary-inverted', t 'var(--clr-text-primary-inverted)'),
  s('clr-text-secondary', t 'var(--clr-text-secondary)'),
  s('clr-text-secondary-inverted', t 'var(--clr-text-secondary-inverted)'),
  s('clr-text-tertiary', t 'var(--clr-text-tertiary)'),
  s('clr-text-tertiary-inverted', t 'var(--clr-text-tertiary-inverted)'),
  s('clr-text-quaternary', t 'var(--clr-text-quaternary)'),
  s('clr-text-brand', t 'var(--clr-text-brand)'),
  s('clr-text-danger', t 'var(--clr-text-danger)'),
  s('clr-text-warning', t 'var(--clr-text-warning)'),
  s('clr-text-success', t 'var(--clr-text-success)'),
  s('clr-text-success-secondary', t 'var(--clr-text-success-secondary)'),

  -- Color variables - Background
  s('clr-background-primary', t 'var(--clr-background-primary)'),
  s('clr-background-primary-inverted', t 'var(--clr-background-primary-inverted)'),
  s('clr-background-secondary', t 'var(--clr-background-secondary)'),
  s('clr-background-tertiary', t 'var(--clr-background-tertiary)'),
  s('clr-background-quaternary', t 'var(--clr-background-quaternary)'),
  s('clr-background-brand', t 'var(--clr-background-brand)'),
  s('clr-background-brand-secondary', t 'var(--clr-background-brand-secondary)'),
  s('clr-background-brand-tertiary', t 'var(--clr-background-brand-tertiary)'),
  s('clr-background-danger', t 'var(--clr-background-danger)'),
  s('clr-background-danger-secondary', t 'var(--clr-background-danger-secondary)'),
  s('clr-background-danger-tertiary', t 'var(--clr-background-danger-tertiary)'),
  s('clr-background-warning', t 'var(--clr-background-warning)'),
  s('clr-background-warning-secondary', t 'var(--clr-background-warning-secondary)'),
  s('clr-background-success', t 'var(--clr-background-success)'),
  s('clr-background-success-secondary', t 'var(--clr-background-success-secondary)'),

  -- Color variables - Border
  s('clr-border-primary', t 'var(--clr-border-primary)'),
  s('clr-border-primary-inverted', t 'var(--clr-border-primary-inverted)'),
  s('clr-border-secondary', t 'var(--clr-border-secondary)'),
  s('clr-border-tertiary', t 'var(--clr-border-tertiary)'),
  s('clr-border-brand', t 'var(--clr-border-brand)'),
  s('clr-border-brand-secondary', t 'var(--clr-border-brand-secondary)'),
  s('clr-border-danger', t 'var(--clr-border-danger)'),
  s('clr-border-warning', t 'var(--clr-border-warning)'),
  s('clr-border-success', t 'var(--clr-border-success)'),

  -- Color variables - Icon
  s('clr-icon-primary', t 'var(--clr-icon-primary)'),
  s('clr-icon-primary-inverted', t 'var(--clr-icon-primary-inverted)'),
  s('clr-icon-secondary', t 'var(--clr-icon-secondary)'),
  s('clr-icon-tertiary', t 'var(--clr-icon-tertiary)'),
  s('clr-icon-brand', t 'var(--clr-icon-brand)'),
  s('clr-icon-brand-secondary', t 'var(--clr-icon-brand-secondary)'),
  s('clr-icon-brand-tertiary', t 'var(--clr-icon-brand-tertiary)'),
  s('clr-icon-danger', t 'var(--clr-icon-danger)'),
  s('clr-icon-warning', t 'var(--clr-icon-warning)'),
  s('clr-icon-success', t 'var(--clr-icon-success)'),
  s('clr-icon-success-secondary', t 'var(--clr-icon-success-secondary)'),

  -- Overlay
  s('clr-overlay-60', t 'var(--clr-overlay-60)'),

  -- Typography - Titles
  s('tpg-title-3xl', t '@include tpg-title-3xl;'),
  s('tpg-title-2xl', t '@include tpg-title-2xl;'),
  s('tpg-title-xl', t '@include tpg-title-xl;'),
  s('tpg-title-l', t '@include tpg-title-l;'),
  s('tpg-title-m', t '@include tpg-title-m;'),
  s('tpg-title-s', t '@include tpg-title-s;'),
  s('tpg-title-xs', t '@include tpg-title-xs;'),
  s('tpg-title-2xs', t '@include tpg-title-2xs;'),

  -- Typography - Body Regular
  s('tpg-body-3xl-regular', t '@include tpg-body-3xl-regular;'),
  s('tpg-body-2xl-regular', t '@include tpg-body-2xl-regular;'),
  s('tpg-body-xl-regular', t '@include tpg-body-xl-regular;'),
  s('tpg-body-l-regular', t '@include tpg-body-l-regular;'),
  s('tpg-body-m-regular', t '@include tpg-body-m-regular;'),
  s('tpg-body-s-regular', t '@include tpg-body-s-regular;'),
  s('tpg-body-xs-regular', t '@include tpg-body-xs-regular;'),
  s('tpg-body-2xs-regular', t '@include tpg-body-2xs-regular;'),

  -- Typography - Body Semibold
  s('tpg-body-3xl-semibold', t '@include tpg-body-3xl-semibold;'),
  s('tpg-body-2xl-semibold', t '@include tpg-body-2xl-semibold;'),
  s('tpg-body-xl-semibold', t '@include tpg-body-xl-semibold;'),
  s('tpg-body-l-semibold', t '@include tpg-body-l-semibold;'),
  s('tpg-body-m-semibold', t '@include tpg-body-m-semibold;'),
  s('tpg-body-s-semibold', t '@include tpg-body-s-semibold;'),
  s('tpg-body-xs-semibold', t '@include tpg-body-xs-semibold;'),
  s('tpg-body-2xs-semibold', t '@include tpg-body-2xs-semibold;'),

  -- Typography - Body Bold
  s('tpg-body-3xl-bold', t '@include tpg-body-3xl-bold;'),
  s('tpg-body-2xl-bold', t '@include tpg-body-2xl-bold;'),
  s('tpg-body-xl-bold', t '@include tpg-body-xl-bold;'),
  s('tpg-body-l-bold', t '@include tpg-body-l-bold;'),
  s('tpg-body-m-bold', t '@include tpg-body-m-bold;'),
  s('tpg-body-s-bold', t '@include tpg-body-s-bold;'),
  s('tpg-body-xs-bold', t '@include tpg-body-xs-bold;'),
  s('tpg-body-2xs-bold', t '@include tpg-body-2xs-bold;'),

  -- Shadows
  s('shadow-s', t 'var(--shadow-s)'),
  s('shadow-m', t 'var(--shadow-m)'),
  s('shadow-m-blue', t 'var(--shadow-m-blue)'),
  s('shadow-l', t 'var(--shadow-l)'),
  s('shadow-l-blue', t 'var(--shadow-l-blue)'),
  s('shadow-xl', t 'var(--shadow-xl)'),
  s('shadow-xl-blue', t 'var(--shadow-xl-blue)'),
  s('shadow-2xl-blue', t 'var(--shadow-2xl-blue)'),
  s('shadow-3xl-blue', t 'var(--shadow-3xl-blue)'),

  -- Focus rings
  s('focus-ring', t 'var(--focus-ring)'),
  s('focus-ring-error', t 'var(--focus-ring-error)'),

  -- Blur
  s('blur-s', t 'var(--blur-s)'),
  s('blur-m', t 'var(--blur-m)'),
  s('blur-l', t 'var(--blur-l)'),
  s('blur-xl', t 'var(--blur-xl)'),
  s('blur-2xl', t 'var(--blur-2xl)'),

  -- Media queries with placeholders
  s('mobile', {
    t '@include mobileSize {',
    t { '', '\t' },
    i(1),
    t { '', '}' },
  }),
  s('tablet', {
    t '@include tabletSize {',
    t { '', '\t' },
    i(1),
    t { '', '}' },
  }),
  s('tabletBig', {
    t '@include tabletBigSize {',
    t { '', '\t' },
    i(1),
    t { '', '}' },
  }),
  s('desktop', {
    t '@include desktopSize {',
    t { '', '\t' },
    i(1),
    t { '', '}' },
  }),
  s('desktopBig', {
    t '@include desktopBigSize {',
    t { '', '\t' },
    i(1),
    t { '', '}' },
  }),
}
