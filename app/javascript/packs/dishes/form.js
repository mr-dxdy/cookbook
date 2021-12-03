import Vue from 'vue/dist/vue.esm'
import Multiselect from 'vue-multiselect/src/Multiselect'
import {Units} from "../../enums.js.erb"

document.addEventListener('DOMContentLoaded', () => {
  createIngredientsComponent();
  createTagsMultiSelect();
});

function createIngredientsComponent() {
  const el = document.getElementById('ingredients');

  let ingredients = JSON.parse(el.dataset.ingredients);
  let products = JSON.parse(el.dataset.products);
  let units = JSON.parse(el.dataset.units);
  let keySeries = 1;

  console.log(Units)

  new Vue({
    el: el,
    data: function() {
      ingredients.forEach((item) => item['key'] = this.getKey() );
      return { ingredients, products, units };
    },
    components: { Multiselect },
    template: `
    <div>
      <div v-for="(ingredient, index) in ingredients" :key="ingredient.key" :ingredient="ingredient" class="input-group">
        <div class="w-50">
          <Multiselect
            v-model="ingredients[index].product"
            placeholder="Выберите продукт"
            selectLabel=""
            label="name"
            track-by="id"
            :options="products">
          </Multiselect>
        </div>
        <input v-bind:value="ingredients[index].product.id" type="hidden" v-bind:name="fieldName(ingredient.key, 'product_id')"></select>
        <input placeholder="Количество" class="form-control" type="number" v-bind:name="fieldName(ingredient.key, 'number')">
        <div class="w-25">
          <Multiselect
            v-model="ingredients[index].unit"
            placeholder="Выберите единицы измерения"
            selectLabel=""
            label="name"
            track-by="id"
            :options="units">
          </Multiselect>
        </div>
        <input v-bind:value="ingredients[index].product.unit" type="hidden" v-bind:name="fieldName(ingredient.key, 'unit')"></select>
        <button class="btn btn-outline-secondary" v-on:click="remove($event,ingredient)">x</button>
      </div>
      <div class="d-grid">
        <button class="btn btn-outline-secondary btn-sm" type="button" v-on:click="add">добавить ингредиент</button>
      </div>
    </div>
    `,
    methods: {
      fieldName: function(key, attr) {
        return `dish[ingredients_attributes][${key}][${attr}]`;
      },

      getKey: function() { return keySeries++; },

      add: function(event) {
        this.ingredients.push({
          key: this.getKey(),
          product: { id: null, unit: null }
        });
      },

      remove: function(event, ingredient) {
        event.preventDefault();
        console.log(ingredient);
      }
    }
  })
}

function createTagsMultiSelect() {
  const el = document.getElementById('dish_tags_ids')
  const tags = JSON.parse(el.dataset.tags);
  const selected = JSON.parse(el.dataset.selected);

  new Vue({
    el: el,
    data: function() { return { tags, selected }; },
    components: { Multiselect },
    template: `
      <div class="form-control">
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
