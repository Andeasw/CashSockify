<script>
(() => {
  const lang = (navigator.language || navigator.userLanguage || '').slice(0, 2).toLowerCase();
  if (lang !== 'zh') return;

  const comment = document.createComment('nobanner');

  const target = document.body || document.documentElement;
  target.appendChild(comment);
})();
</script>
