// Global tabs behavior: if you prefer a single global script instead of inline per-instance scripts
document.addEventListener('DOMContentLoaded', function(){
  document.querySelectorAll('.r-tabs').forEach(function(root){
    const nav = root.querySelector('.r-tabs-nav');
    const panels = root.querySelectorAll('.r-tabs-panel');
    if (!nav) return;
    // ensure first active if none
    const buttons = Array.from(nav.querySelectorAll('button[data-tab]'));
    const activate = (btn) => {
      if (!btn) return;
      buttons.forEach(b=>{ b.classList.remove('active'); b.setAttribute('aria-selected','false'); b.setAttribute('tabindex','-1'); });
      panels.forEach(p=>p.classList.remove('active'));
      btn.classList.add('active'); btn.setAttribute('aria-selected','true'); btn.setAttribute('tabindex','0');
      const target = root.querySelector('#'+btn.getAttribute('data-tab'));
      if (target) target.classList.add('active');
      btn.focus();
    };

    // ensure first active if none
    const firstBtn = buttons.find(b=>b.classList.contains('active')) || buttons[0];
    if (firstBtn) activate(firstBtn);

    nav.addEventListener('click', function(e){
      const btn = e.target.closest('button[data-tab]');
      if (!btn) return;
      activate(btn);
    });

    // keyboard navigation: Left/Right/Home/End
    nav.addEventListener('keydown', function(e){
      const currentIdx = buttons.indexOf(document.activeElement);
      if (currentIdx === -1) return;
      let nextIdx = null;
      switch(e.key) {
        case 'ArrowRight': nextIdx = (currentIdx + 1) % buttons.length; break;
        case 'ArrowLeft': nextIdx = (currentIdx - 1 + buttons.length) % buttons.length; break;
        case 'Home': nextIdx = 0; break;
        case 'End': nextIdx = buttons.length - 1; break;
        case 'Enter': case ' ': // Space
          e.preventDefault(); activate(document.activeElement); return;
        default: return;
      }
      e.preventDefault();
      activate(buttons[nextIdx]);
    });
  });
});
