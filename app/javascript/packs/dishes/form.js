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
  let units = Units;
  let keySeries = 1;

  new Vue({
    el: el,
    data: function() {
      ingredients.forEach((item) => {
        item.key = this.getKey();
        item.destroy = false;
      });

      return { ingredients, products, units };
    },
    components: { Multiselect },
    template: `
    <div>
      <div v-for="(ingredient, index) in persistedIngredients" :key="ingredient.key" :ingredient="ingredient" class="input-group">
        <input v-model="persistedIngredients[index].id" type="hidden" v-bind:name="fieldName(ingredient.key, 'id')">
        <div class="w-50">
          <Multiselect
            v-model="persistedIngredients[index].product"
            placeholder="Выберите продукт"
            selectLabel=""
            label="name"
            track-by="id"
            :options="products">
          </Multiselect>
        </div>
        <input v-model="persistedIngredients[index].product.id" type="hidden" v-bind:name="fieldName(ingredient.key, 'product_id')"></select>
        <input v-model="persistedIngredients[index].number" placeholder="Количество" class="form-control" type="number" v-bind:name="fieldName(ingredient.key, 'number')">
        <div class="w-25">
          <Multiselect
            v-model="persistedIngredients[index].unit"
            placeholder="Выберите единицы измерения"
            selectLabel=""
            label="local_abbrev"
            track-by="id"
            :options="units">
          </Multiselect>
        </div>
        <input v-model="persistedIngredients[index].unit.name" type="hidden" v-bind:name="fieldName(ingredient.key, 'unit')"></select>
        <button class="btn btn-outline-secondary" v-on:click="remove($event,index)">x</button>
      </div>
      <div class="d-grid">
        <button class="btn btn-outline-secondary btn-sm" type="button" v-on:click="add">добавить ингредиент</button>
      </div>
      <div v-for="(ingredient, index) in removedIngredients" :key="ingredient.id" :ingredient="ingredient" class="input-group">
        <input v-model="removedIngredients[index].id" type="hidden" v-bind:name="fieldName(ingredient.id, 'id')">
        <input v-model="removedIngredients[index].destroy" type="hidden" v-bind:name="fieldName(ingredient.id, '_destroy')">
      </div>
    </div>
    `,
    computed: {
      removedIngredients() {
        return this.ingredients.filter(ingredient => ingredient.destroy);
      },

      persistedIngredients() {
        return this.ingredients.filter(ingredient => !ingredient.destroy);
      }
    },

    methods: {
      fieldName: function(key, attr) {
        return `dish[ingredients_attributes][${key}][${attr}]`;
      },

      getKey: function() { return Date.now() + keySeries++ },

      add: function(event) {
        this.ingredients.push({
          id: null,
          key: this.getKey(),
          product: { id: null },
          unit: { id: null },
          destroy: false,
          number: null
        });
      },

      remove: function(event, index) {
        event.preventDefault();
        this.persistedIngredients[index].destroy = true;
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
          v-model="tag.id"
          type="hidden"
          multiple="multiple"
          name="dish[tag_ids][]"
        />
      </div>
    `
  })
}
