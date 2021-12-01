import Vue from 'vue/dist/vue.esm'
import Multiselect from 'vue-multiselect/src/Multiselect'

document.addEventListener('DOMContentLoaded', () => {
  createCategoriesMultiSelect();
});

function createCategoriesMultiSelect() {
  const el = document.getElementById('product_categories_ids')
  const categories = JSON.parse(el.dataset.categories);
  const selected = JSON.parse(el.dataset.selected);

  new Vue({
    el: el,
    data: function() { return { categories, selected }; },
    components: { Multiselect },
    template: `
      <div class="form-control">
        <Multiselect
          v-model="selected"
          placeholder="Выберите категории"
          selectLabel=""
          label="name"
          track-by="id"
          :options="categories"
          :multiple="true"
          :taggable="true">
        </Multiselect>
        <input v-for="category in selected" :key="category.id" :category="category"
          v-bind:value="category.id"
          type="hidden"
          multiple="multiple"
          name="product[category_ids][]"
        />
      </div>
    `
  })
}
