<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Articulos */

$this->title = Yii::t('app', 'Crear Articulos');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Articulos'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="articulos-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model, 'categoria' => $categoria,
    ]) ?>

</div>
