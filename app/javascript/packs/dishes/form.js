import Vue from 'vue/dist/vue.esm'
import Multiselect from 'vue-multiselect/src/Multiselect'

document.addEventListener('DOMContentLoaded', () => {
  createTagsMultiSelect();
});

function createTagsMultiSelect() {
  const el = document.getElementById('dish_tags_ids')
  const tags = JSON.parse(el.dataset.tags);
  const selected = JSON.parse(el.dataset.selected);

  new Vue({
    el: el,
    data: function() { return { tags, selected }; },
    components: { Multiselect },
    template: `
      <div>
        <Multiselect
          v-model="selected"
          placeholder="Выберите теги"
          selectLabel=""
          label="name"
          track-by="id"
          :options="tags"
          :multiple="true"
          :taggable="true">
        </Multiselect>
        <input v-for="tag in selected" :key="tag.id" :tag="tag"
          v-bind:value="tag.id"
          type="hidden"
          multiple="multiple"
          name="dish[tag_ids][]"
        />
      </div>
    `
  })
}
